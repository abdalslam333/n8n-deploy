# استخدم الصورة الرسمية لـ n8n (مبنية على Alpine)
FROM n8nio/n8n:latest

# تفعيل المستخدم الجذر مؤقتاً لتثبيت tini
USER root

# تثبيت tini باستخدام apk بدلاً من apt-get
RUN apk update && apk add --no-cache tini

# تعيين المنطقة الزمنية
ENV GENERIC_TIMEZONE=Asia/Riyadh

# تفعيل الدخول بكلمة مرور
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD="9nV5dngK'oLcMIVC,Vy)"

# إعداد الرابط
ENV N8N_PROTOCOL=https
ENV N8N_HOST=n8n.sdt-sa.com
ENV WEBHOOK_URL=https://n8n.sdt-sa.com/

# مفتاح التشفير
ENV N8N_ENCRYPTION_KEY=thisIsASecretKey123

# تفعيل بيئة الإنتاج
ENV NODE_ENV=production

# المنفذ
EXPOSE 5678

# إعادة المستخدم الافتراضي
USER node

# أمر التشغيل
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["n8n", "start"]
