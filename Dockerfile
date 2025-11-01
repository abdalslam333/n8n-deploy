# استخدم صورة n8n الرسمية
FROM n8nio/n8n:latest

# تثبيت tini بشكل يدوي داخل الحاوية
USER root
RUN apt-get update && apt-get install -y tini && apt-get clean

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

# بيئة الإنتاج
ENV NODE_ENV=production

# تعيين المستخدم مجددًا بعد التثبيت
USER node

# المنفذ
EXPOSE 5678

# أمر التشغيل
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["n8n", "start"]
