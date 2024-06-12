function out = gendata(a,b,c,d,e,x0,y0,ki,theta,f,n)
%
% gendata.m
%
% Model exported on Jan 23 2024, 18:46 by COMSOL 6.1.0.252.

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('D:\inhomogeneous');

model.label('TE.mph');

model.param.set('a', num2str(a));
model.param.set('b', num2str(b));
model.param.set('c', num2str(c));
model.param.set('d', num2str(d));
model.param.set('e', num2str(e));
model.param.set('x0', num2str(x0));
model.param.set('y0', num2str(y0));
model.param.set('ki', num2str(ki));
model.param.set('theta', num2str(theta));
model.param.set('f', num2str(f));

model.component.create('comp1', true);

model.component('comp1').geom.create('geom1', 2);

model.component('comp1').mesh.create('mesh1');

model.component('comp1').geom('geom1').lengthUnit('nm');
model.component('comp1').geom('geom1').create('sq1', 'Square');
model.component('comp1').geom('geom1').feature('sq1').set('base', 'center');
model.component('comp1').geom('geom1').feature('sq1').set('size', 148);
model.component('comp1').geom('geom1').create('sq2', 'Square');
model.component('comp1').geom('geom1').feature('sq2').set('base', 'center');
model.component('comp1').geom('geom1').feature('sq2').set('size', 128);
model.component('comp1').geom('geom1').create('sq3', 'Square');
model.component('comp1').geom('geom1').feature('sq3').set('pos', [-69 69]);
model.component('comp1').geom('geom1').feature('sq3').set('base', 'center');
model.component('comp1').geom('geom1').feature('sq3').set('size', 10);
model.component('comp1').geom('geom1').create('r1', 'Rectangle');
model.component('comp1').geom('geom1').feature('r1').set('pos', [0 69]);
model.component('comp1').geom('geom1').feature('r1').set('base', 'center');
model.component('comp1').geom('geom1').feature('r1').set('size', [128 10]);
model.component('comp1').geom('geom1').create('sq4', 'Square');
model.component('comp1').geom('geom1').feature('sq4').set('pos', [69 69]);
model.component('comp1').geom('geom1').feature('sq4').set('base', 'center');
model.component('comp1').geom('geom1').feature('sq4').set('size', 10);
model.component('comp1').geom('geom1').create('sq5', 'Square');
model.component('comp1').geom('geom1').feature('sq5').set('pos', [-69 -69]);
model.component('comp1').geom('geom1').feature('sq5').set('base', 'center');
model.component('comp1').geom('geom1').feature('sq5').set('size', 10);
model.component('comp1').geom('geom1').create('sq6', 'Square');
model.component('comp1').geom('geom1').feature('sq6').set('pos', [69 -69]);
model.component('comp1').geom('geom1').feature('sq6').set('base', 'center');
model.component('comp1').geom('geom1').feature('sq6').set('size', 10);
model.component('comp1').geom('geom1').create('r2', 'Rectangle');
model.component('comp1').geom('geom1').feature('r2').set('pos', [0 -69]);
model.component('comp1').geom('geom1').feature('r2').set('base', 'center');
model.component('comp1').geom('geom1').feature('r2').set('size', [128 10]);
model.component('comp1').geom('geom1').create('r3', 'Rectangle');
model.component('comp1').geom('geom1').feature('r3').set('pos', [69 0]);
model.component('comp1').geom('geom1').feature('r3').set('base', 'center');
model.component('comp1').geom('geom1').feature('r3').set('size', [10 128]);
model.component('comp1').geom('geom1').create('r4', 'Rectangle');
model.component('comp1').geom('geom1').feature('r4').set('pos', [-69 0]);
model.component('comp1').geom('geom1').feature('r4').set('base', 'center');
model.component('comp1').geom('geom1').feature('r4').set('size', [10 128]);
model.component('comp1').geom('geom1').run;

model.component('comp1').variable.create('var1');
model.component('comp1').variable('var1').set('epsilon', '1+ki*exp(-(a*(x[1/nm]/64-x0)^4+b*(x[1/nm]/64-x0)^2*(y[1/nm]/64-y0)^2+c*(y[1/nm]/64-y0)^4+d*(x[1/nm]/64-x0)^2+e*(y[1/nm] /64-y0)^2))');

model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material('mat3').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat3').propertyGroup.create('RefractiveIndex', 'Refractive index');

model.component('comp1').coordSystem.create('pml1', 'PML');
model.component('comp1').coordSystem('pml1').selection.set([1 2 3 4 6 7 8 9]);

model.component('comp1').physics.create('emw', 'ElectromagneticWaves', 'geom1');
model.component('comp1').physics('emw').create('sctr1', 'Scattering', 1);
model.component('comp1').physics('emw').feature('sctr1').selection.set([1 2 3 5 7 9 14 16 21 22 23]);

model.component('comp1').mesh('mesh1').autoMeshSize(2);

model.component('comp1').view('view1').axis.set('xmin', -138.73512268066406);
model.component('comp1').view('view1').axis.set('xmax', 138.73512268066406);
model.component('comp1').view('view1').axis.set('ymin', -77.70000457763672);
model.component('comp1').view('view1').axis.set('ymax', 77.70000457763672);

model.component('comp1').material('mat3').label('Air1');
model.component('comp1').material('mat3').set('family', 'custom');
model.component('comp1').material('mat3').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat3').set('customdiffuse', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat3').set('customambient', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat3').set('fresnel', 0.7);
model.component('comp1').material('mat3').set('metallic', 0);
model.component('comp1').material('mat3').set('pearl', 0);
model.component('comp1').material('mat3').set('diffusewrap', 0);
model.component('comp1').material('mat3').set('clearcoat', 0);
model.component('comp1').material('mat3').set('reflectance', 0);
model.component('comp1').material('mat3').propertyGroup('def').label('Basic');
model.component('comp1').material('mat3').propertyGroup('def').set('relpermeability', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat3').propertyGroup('def').set('electricconductivity', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat3').propertyGroup('def').set('thermalexpansioncoefficient', {'2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]'});
model.component('comp1').material('mat3').propertyGroup('def').set('heatcapacity', '700[J/(kg*K)]');
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'epsilon' '0' '0' '0' 'epsilon' '0' '0' '0' 'epsilon'});
model.component('comp1').material('mat3').propertyGroup('def').set('density', '2329[kg/m^3]');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', {'130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]'});
model.component('comp1').material('mat3').propertyGroup('Enu').label('Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat3').propertyGroup('Enu').set('E', '170[GPa]');
model.component('comp1').material('mat3').propertyGroup('Enu').set('nu', '0.28');
model.component('comp1').material('mat3').propertyGroup('RefractiveIndex').label('Refractive index');
model.component('comp1').material('mat3').propertyGroup('RefractiveIndex').set('n', {'3.48' '0' '0' '0' '3.48' '0' '0' '0' '3.48'});

model.component('comp1').physics('emw').prop('BackgroundField').set('SolveFor', 'scatteredField');
model.component('comp1').physics('emw').prop('BackgroundField').set('Eb', {'-1[V/m]*exp(j*emw.k0*(-x*cos(theta)-y*sin(theta)))*sin(theta)'; '1[V/m]*exp(j*emw.k0*(-x*cos(theta)-y*sin(theta)))*cos(theta)'; '0'});

model.study.create('std1');
model.study('std1').create('freq', 'Frequency');

model.sol.create('sol1');
model.sol('sol1').study('std1');
model.sol('sol1').attach('std1');
model.sol('sol1').create('st1', 'StudyStep');
model.sol('sol1').create('v1', 'Variables');
model.sol('sol1').create('s1', 'Stationary');

model.sol('sol1').feature('s1').create('p1', 'Parametric');
model.sol('sol1').feature('s1').create('fc1', 'FullyCoupled');
model.sol('sol1').feature('s1').create('d1', 'Direct');
model.sol('sol1').feature('s1').feature.remove('fcDef');

model.result.create('pg1', 'PlotGroup2D');
model.result.create('pg2', 'PlotGroup2D');
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', 'real(emw.Hz)');
model.result('pg2').create('surf1', 'Surface');
model.result('pg2').feature('surf1').set('expr', 'epsilon');
model.result.export.create('data1', 'Data');

model.study('std1').feature('freq').set('plist', 'f[GHz]');

model.sol('sol1').attach('std1');
model.sol('sol1').feature('st1').label([native2unicode(hex2dec({'7f' '16'}), 'unicode')  native2unicode(hex2dec({'8b' 'd1'}), 'unicode')  native2unicode(hex2dec({'65' 'b9'}), 'unicode')  native2unicode(hex2dec({'7a' '0b'}), 'unicode') ': ' native2unicode(hex2dec({'98' '91'}), 'unicode')  native2unicode(hex2dec({'57' 'df'}), 'unicode') ]);
model.sol('sol1').feature('v1').label([native2unicode(hex2dec({'56' 'e0'}), 'unicode')  native2unicode(hex2dec({'53' 'd8'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('v1').set('clistctrl', {'p1'});
model.sol('sol1').feature('v1').set('cname', {'freq'});
model.sol('sol1').feature('v1').set('clist', {'f[GHz]'});
model.sol('sol1').feature('s1').label([native2unicode(hex2dec({'7a' '33'}), 'unicode')  native2unicode(hex2dec({'60' '01'}), 'unicode')  native2unicode(hex2dec({'6c' '42'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').set('stol', 0.01);
model.sol('sol1').feature('s1').set('plot', true);
model.sol('sol1').feature('s1').feature('dDef').label([native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode') ' 2']);
model.sol('sol1').feature('s1').feature('aDef').label([native2unicode(hex2dec({'9a' 'd8'}), 'unicode')  native2unicode(hex2dec({'7e' 'a7'}), 'unicode') ' 1']);
model.sol('sol1').feature('s1').feature('aDef').set('complexfun', true);
model.sol('sol1').feature('s1').feature('pDef').label([native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'53' '16'}), 'unicode') ' 2']);
model.sol('sol1').feature('s1').feature('pDef').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('pDef').set('plistarr', {'f[GHz]'});
model.sol('sol1').feature('s1').feature('pDef').set('punit', {'GHz'});
model.sol('sol1').feature('s1').feature('pDef').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('pDef').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('pDef').set('uselsqdata', false);
model.sol('sol1').feature('s1').feature('pDef').set('plot', true);
model.sol('sol1').feature('s1').feature('p1').label([native2unicode(hex2dec({'53' 'c2'}), 'unicode')  native2unicode(hex2dec({'65' '70'}), 'unicode')  native2unicode(hex2dec({'53' '16'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').feature('p1').set('pname', {'freq'});
model.sol('sol1').feature('s1').feature('p1').set('plistarr', {'f[GHz]'});
model.sol('sol1').feature('s1').feature('p1').set('punit', {'GHz'});
model.sol('sol1').feature('s1').feature('p1').set('pcontinuationmode', 'no');
model.sol('sol1').feature('s1').feature('p1').set('preusesol', 'auto');
model.sol('sol1').feature('s1').feature('p1').set('plot', true);
model.sol('sol1').feature('s1').feature('fc1').label([native2unicode(hex2dec({'51' '68'}), 'unicode')  native2unicode(hex2dec({'80' '26'}), 'unicode')  native2unicode(hex2dec({'54' '08'}), 'unicode') ' 1.1']);
model.sol('sol1').feature('s1').feature('fc1').set('maxiter', 300);
model.sol('sol1').feature('s1').feature('d1').label([native2unicode(hex2dec({'5e' 'fa'}), 'unicode')  native2unicode(hex2dec({'8b' 'ae'}), 'unicode')  native2unicode(hex2dec({'76' '84'}), 'unicode')  native2unicode(hex2dec({'76' 'f4'}), 'unicode')  native2unicode(hex2dec({'63' 'a5'}), 'unicode')  native2unicode(hex2dec({'6c' '42'}), 'unicode')  native2unicode(hex2dec({'89' 'e3'}), 'unicode')  native2unicode(hex2dec({'56' '68'}), 'unicode') ' (emw)']);
model.sol('sol1').feature('s1').feature('d1').set('linsolver', 'pardiso');
model.sol('sol1').runAll;

model.result('pg1').feature('surf1').set('colortable', 'Rainbow');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result('pg2').feature('surf1').set('colortable', 'Rainbow');
model.result('pg2').feature('surf1').set('resolution', 'normal');
model.result.export('data1').set('expr', {'emw.Hz'});
model.result.export('data1').set('unit', {'A/m'});
model.result.export('data1').set('descr', {[native2unicode(hex2dec({'78' 'c1'}), 'unicode')  native2unicode(hex2dec({'57' '3a'}), 'unicode')  native2unicode(hex2dec({'ff' '0c'}), 'unicode') 'z ' native2unicode(hex2dec({'52' '06'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode') ]});
model.result.export('data1').set('filename', ['D:\inhomogeneous\Hz0\' num2str(n) '.csv']);
model.result.export('data1').set('location', 'regulargrid');
model.result.export('data1').set('regulargridx2', 148);
model.result.export('data1').set('regulargridy2', 148);
model.result.export('data1').set('separator', ',');
model.result.export('data1').run();

out = model;
