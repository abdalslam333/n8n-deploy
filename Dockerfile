# استخدم الصورة الرسمية لـ n8n
FROM n8nio/n8n

# المنطقة الزمنية (توقيت السعودية)
ENV GENERIC_TIMEZONE=Asia/Riyadh

# تفعيل حماية الدخول
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD="9nV5dngK'oLcMIVC,Vy)"

# إعدادات الرابط (نحدثها لاحقاً بعد ربط الدومين)
ENV N8N_PROTOCOL=https
ENV N8N_HOST=n8n.sdt-sa.com
ENV WEBHOOK_URL=https://n8n.sdt-sa.com/

# مفتاح التشفير (استخدم نفس المفتاح القديم لو عندك)
ENV N8N_ENCRYPTION_KEY=thisIsASecretKey123

# إعدادات إضافية آمنة
ENV N8N_TRUSTED_PROXIES=loopback,linklocal,uniquelocal
ENV NODE_ENV=production

# المنفذ المستخدم
EXPOSE 5678

# أمر التشغيل
CMD ["/tini", "--", "n8n", "start"]

