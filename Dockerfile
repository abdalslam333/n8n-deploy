# استخدم النسخة الكاملة من n8n (تحتوي على tini)
FROM n8nio/n8n:latest-full

# تعيين المنطقة الزمنية
ENV GENERIC_TIMEZONE=Asia/Riyadh

# تفعيل الدخول باسم مستخدم وكلمة مرور
ENV N8N_BASIC_AUTH_ACTIVE=true
ENV N8N_BASIC_AUTH_USER=admin
ENV N8N_BASIC_AUTH_PASSWORD="9nV5dngK'oLcMIVC,Vy)"

# إعداد البروتوكول والمضيف
ENV N8N_PROTOCOL=https
ENV N8N_HOST=n8n.sdt-sa.com
ENV WEBHOOK_URL=https://n8n.sdt-sa.com/

# مفتاح التشفير
ENV N8N_ENCRYPTION_KEY=thisIsASecretKey123

# تفعيل البيئة الإنتاجية
ENV NODE_ENV=production

# المنفذ المستخدم
EXPOSE 5678

# أمر التشغيل (النسخة الكاملة تحتوي على tini داخل الصورة)
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
