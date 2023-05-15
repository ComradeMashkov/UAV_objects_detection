clc
clear variables
close all

results = 'results.csv';
data = readtable(results, VariableNamingRule="modify");

epochs = data.('epoch');
map_single = data.('metrics_mAP50_B_');
map_multiple = data.('metrics_mAP50_95_B_');
train_box_loss = data.('train_box_loss');
train_cls_loss = data.('train_cls_loss');
val_box_loss = data.('val_box_loss');
val_cls_loss = data.('val_cls_loss');
precision = data.('metrics_precision_B_');
recall = data.('metrics_recall_B_');

f1 = figure;
hold on;
plot(epochs, train_box_loss);
plot(epochs, val_box_loss);
xlabel('Количество эпох');
ylabel('Значение потери');
legend('обучение', 'проверка');
title('Значение потери предсказания ограничивающей рамки в процессе обучения');
grid on;
grid minor;
hold off;

f2 = figure;
hold on;
plot(epochs, train_cls_loss);
plot(epochs, val_cls_loss);
xlabel('Количество эпох');
ylabel('Значение потери');
legend('обучение', 'проверка');
title('Значение потери предсказания класса в процессе обучения');
grid on;
grid minor;
hold off;

f3 = figure;
hold on;
plot(epochs, map_single .* 100);
plot(epochs, map_multiple .* 100);
xlabel('Количество эпох');
ylabel('mAP, %');
legend('одиночный объект', 'несколько объектов');
title('Значение нормированной средней точности предсказания в процессе обучения');
grid on;
grid minor;
hold off;

f4 = figure;
hold on;
plot(epochs, precision .* 100);
plot(epochs, recall .* 100);
xlabel('Количество эпох');
ylabel('Значение, %');
legend('точность', 'полнота');
title('Значение точности и полноты в процессе обучения');
grid on;
grid minor;
hold off;
