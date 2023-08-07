# x = c(1,3,3,1)
# y = c(1,1,3,3)
# frame()
# plot.window(xlim = c(0,5), ylim = c(0,5), asp = 1)
# polygon(x,y, col = rgb(204,121,167,255, maxColorValue = 255))

# parameters
dist_ratio = 2
vol_aq = 25
vol_org = 25
num_extract = 1
q_aq = (vol_aq/(dist_ratio*vol_org + vol_aq))^num_extract
q_org = 1 - q_aq

# phases
x_aq = c(1,3,3,1)
y_aq = c(1,1,3,3)
x_org = c(1,3,3,1)
y_org = c(3,3,5,5)

# sketch
frame()
plot.window(xlim = c(0,6), ylim = c(0,6), asp = 1)
polygon(x_aq, y_aq, border = 1, col = rgb(204,121,167,q_aq*255, maxColorValue = 255))
polygon(x_org, y_org, border = 1, col = rgb(204,121,167,q_org*255, maxColorValue = 255))
