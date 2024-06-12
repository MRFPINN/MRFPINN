function genLCP(eps,mu,theta,f,n)
%
% TE1.m
%
% Model exported on Nov 3 2023, 20:04 by COMSOL 6.1.0.252.

pathgemo=['D:\Data\chiral\polycsv\' num2str(n) '.csv'];
pathsave=['D:\Data\chiral\data_LCP\' num2str(n) '.csv'];

import com.comsol.model.*
import com.comsol.model.util.*

model = ModelUtil.create('Model');

model.modelPath('D:\Data\chiral');

model.label('TE1.mph');


model.param.set('epsilon', num2str(eps));
model.param.set('mu', num2str(mu));
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
model.component('comp1').geom('geom1').create('pol1', 'Polygon');
model.component('comp1').geom('geom1').feature('pol1').set('source', 'file');
model.component('comp1').geom('geom1').feature('pol1').set('filename', pathgemo);
model.component('comp1').geom('geom1').run;

model.component('comp1').material.create('mat2', 'Common');
model.component('comp1').material.create('mat3', 'Common');
model.component('comp1').material('mat2').selection.set([7]);
model.component('comp1').material('mat2').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat2').propertyGroup.create('RefractiveIndex', 'Refractive index');
model.component('comp1').material('mat3').selection.set([1 2 3 4 5 6 8 9 10]);
model.component('comp1').material('mat3').propertyGroup.create('Enu', 'Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat3').propertyGroup.create('RefractiveIndex', 'Refractive index');

model.component('comp1').coordSystem.create('pml1', 'PML');
model.component('comp1').coordSystem('pml1').selection.set([1 2 3 4 6 8 9 10]);

model.component('comp1').physics.create('emw', 'ElectromagneticWaves', 'geom1');
model.component('comp1').physics('emw').create('sctr1', 'Scattering', 1);
model.component('comp1').physics('emw').feature('sctr1').selection.set([1 2 3 5 7 9 14 22 27 28 29]);

model.component('comp1').view('view1').axis.set('xmin', -112.39891052246094);
model.component('comp1').view('view1').axis.set('xmax', 112.39891052246094);
model.component('comp1').view('view1').axis.set('ymin', -77.70000457763672);
model.component('comp1').view('view1').axis.set('ymax', 77.70000457763672);

model.component('comp1').material('mat2').label('Silicon');
model.component('comp1').material('mat2').set('family', 'custom');
model.component('comp1').material('mat2').set('customspecular', [0.7843137254901961 1 1]);
model.component('comp1').material('mat2').set('customdiffuse', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat2').set('customambient', [0.6666666666666666 0.6666666666666666 0.7058823529411765]);
model.component('comp1').material('mat2').set('fresnel', 0.7);
model.component('comp1').material('mat2').set('metallic', 0);
model.component('comp1').material('mat2').set('pearl', 0);
model.component('comp1').material('mat2').set('diffusewrap', 0);
model.component('comp1').material('mat2').set('clearcoat', 0);
model.component('comp1').material('mat2').set('reflectance', 0);
model.component('comp1').material('mat2').propertyGroup('def').label('Basic');
model.component('comp1').material('mat2').propertyGroup('def').set('relpermeability', {'mu' '0' '0' '0' 'mu' '0' '0' '0' 'mu'});
model.component('comp1').material('mat2').propertyGroup('def').set('electricconductivity', {'0' '0' '0' '0' '0' '0' '0' '0' '0'});
model.component('comp1').material('mat2').propertyGroup('def').set('thermalexpansioncoefficient', {'2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]' '0' '0' '0' '2.6e-6[1/K]'});
model.component('comp1').material('mat2').propertyGroup('def').set('heatcapacity', '700[J/(kg*K)]');
model.component('comp1').material('mat2').propertyGroup('def').set('relpermittivity', {'epsilon' '0' '0' '0' 'epsilon' '0' '0' '0' 'epsilon'});
model.component('comp1').material('mat2').propertyGroup('def').set('density', '2329[kg/m^3]');
model.component('comp1').material('mat2').propertyGroup('def').set('thermalconductivity', {'130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]'});
model.component('comp1').material('mat2').propertyGroup('Enu').label('Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat2').propertyGroup('Enu').set('E', '170[GPa]');
model.component('comp1').material('mat2').propertyGroup('Enu').set('nu', '0.28');
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').label('Refractive index');
model.component('comp1').material('mat2').propertyGroup('RefractiveIndex').set('n', {'3.48' '0' '0' '0' '3.48' '0' '0' '0' '3.48'});
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
model.component('comp1').material('mat3').propertyGroup('def').set('relpermittivity', {'1' '0' '0' '0' '1' '0' '0' '0' '1'});
model.component('comp1').material('mat3').propertyGroup('def').set('density', '2329[kg/m^3]');
model.component('comp1').material('mat3').propertyGroup('def').set('thermalconductivity', {'130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]' '0' '0' '0' '130[W/(m*K)]'});
model.component('comp1').material('mat3').propertyGroup('Enu').label('Young''s modulus and Poisson''s ratio');
model.component('comp1').material('mat3').propertyGroup('Enu').set('E', '170[GPa]');
model.component('comp1').material('mat3').propertyGroup('Enu').set('nu', '0.28');
model.component('comp1').material('mat3').propertyGroup('RefractiveIndex').label('Refractive index');
model.component('comp1').material('mat3').propertyGroup('RefractiveIndex').set('n', {'3.48' '0' '0' '0' '3.48' '0' '0' '0' '3.48'});

model.component('comp1').physics('emw').prop('BackgroundField').set('SolveFor', 'scatteredField');
model.component('comp1').physics('emw').prop('BackgroundField').set('Eb', {'j*1[V/m]*exp(j*emw.k0*(-x*cos(theta)-y*sin(theta)))*sin(theta)'; '-j*1[V/m]*exp(j*emw.k0*(-x*cos(theta)-y*sin(theta)))*cos(theta)'; '1[V/m]*exp(j*emw.k0*(-x*cos(theta)-y*sin(theta)))'});

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
model.result('pg1').create('surf1', 'Surface');
model.result('pg1').feature('surf1').set('expr', 'emw.Ez');
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

model.result('pg1').label([native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'57' '3a'}), 'unicode') ' (emw)']);
model.result('pg1').set('frametype', 'spatial');
model.result('pg1').set('showlegendsmaxmin', true);
model.result('pg1').feature('surf1').label([native2unicode(hex2dec({'88' '68'}), 'unicode')  native2unicode(hex2dec({'97' '62'}), 'unicode') ]);
model.result('pg1').feature('surf1').set('smooth', 'internal');
model.result('pg1').feature('surf1').set('resolution', 'normal');
model.result.export('data1').set('expr', {'emw.Ex' 'emw.Ey' 'emw.Ez' 'emw.Hz'});
model.result.export('data1').set('unit', {'V/m' 'V/m' 'V/m' 'A/m'});
model.result.export('data1').set('descr', {[native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'57' '3a'}), 'unicode')  native2unicode(hex2dec({'ff' '0c'}), 'unicode') 'x ' native2unicode(hex2dec({'52' '06'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode') ] [native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'57' '3a'}), 'unicode')  native2unicode(hex2dec({'ff' '0c'}), 'unicode') 'y ' native2unicode(hex2dec({'52' '06'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode') ] [native2unicode(hex2dec({'75' '35'}), 'unicode')  native2unicode(hex2dec({'57' '3a'}), 'unicode')  native2unicode(hex2dec({'ff' '0c'}), 'unicode') 'z ' native2unicode(hex2dec({'52' '06'}), 'unicode')  native2unicode(hex2dec({'91' 'cf'}), 'unicode') ]});
model.result.export('data1').set('filename', pathsave);
model.result.export('data1').set('location', 'regulargrid');
model.result.export('data1').set('regulargridx2', 148);
model.result.export('data1').set('regulargridy2', 148);
model.result.export('data1').set('separator', ',');
model.result.export('data1').run();

out = model;
