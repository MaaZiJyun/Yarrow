import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yarrow/HexDetail.dart';

class AllList extends StatelessWidget {
  static final hexagramNumList = [
    {
      'Name': 'QIAN',
      // 'Cname': '乾',
      'Num': [1, 1, 1, 1, 1, 1],
      'Compare': '7 : 7', //主客实力对比
      'Symbol': 'Upper sky, lower sky',
      'Feature': 'Powerful, active and Healthy',
      'Word':
          'Spring as Beginning; Summer as Growing; Autumn as rewarding; Winter as hiding',
      'Intro': '天行健，君子以自强不息。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'KUN',
      // 'Cname': '坤',
      'Num': [0, 0, 0, 0, 0, 0],
      'Compare': '0 : 0', //主客实力对比
      'Symbol': 'Upper earth, lower earth',
      'Feature': 'Soft, static and mild',
      'Word':
          'Happiness. The gentleman went to travel, lost his way first, and then found the master, luckily.',
      'Intro': '地势坤，君子以厚德载物。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'ZHUN',
      // 'Cname': '',
      'Num': [1, 0, 0, 0, 1, 0],
      'Compare': '4 : 2', //主客实力对比
      'Symbol': 'Upper water, lower thunder',
      'Feature': 'Dangers and Hard',
      'Word': 'Dangers are clustered and the environment is harsh.',
      'Intro': '云雷屯，君子以经纶。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'MENG',
      // 'Cname': '',
      'Num': [0, 1, 0, 0, 0, 1],
      'Compare': '4 : 1', //主客实力对比
      'Symbol': 'Upper Mountain, lower water',
      'Feature': 'Enlightenment and understanding',
      'Word':
          'People need to have education to cultivate hardworking spirit, and take action',
      'Intro': '山下出泉，蒙；君子以果行育德。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'XU',
      // 'Cname': '',
      'Num': [1, 1, 1, 0, 1, 0],
      'Compare': '7 : 2', //主客实力对比
      'Symbol': 'Upper water, lower sky',
      'Feature': 'Risks and opportunities',
      'Word':
          'With trust, it is bright and smooth. Persevering in auspiciousness will help to cross the great rivers.',
      'Intro': '云上于天，需；君子以饮食宴乐。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'SONG',
      // 'Cname': '',
      'Num': [0, 1, 0, 1, 1, 1],
      'Compare': '2 : 7', //主客实力对比
      'Symbol': 'Upper sky, lower water',
      'Feature': 'Vigorous and sinister', //包含的特征
      'Word':
          'You should find someone with great virtue and talent to make a decision, and don\'t take risks.', //结论
      'Intro': '天与水违行，讼；君子以作事谋始。', //类比和举例
      'Evaluation': 'Negative',
    },
    {
      'Name': 'SHI',
      // 'Cname': '',
      'Num': [0, 1, 0, 0, 0, 0],
      'Compare': '2 : 0', //主客实力对比
      'Symbol': 'Upper earth, lower water',
      'Feature': 'Struggle and war',
      'Word':
          'The army must be an army of justice, and the war must be supported by the people in order to be invincible.',
      'Intro': '地中有水，师；君子以容民畜众。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'BI',
      // 'Cname': '',
      'Num': [0, 0, 0, 0, 1, 0],
      'Compare': '0 : 2', //主客实力对比
      'Symbol': 'Upper water, lower earth',
      'Feature': 'Assist and unity',
      'Word': 'Closeness, solidarity and mutual assistance',
      'Intro': '地上有水，比；先王以建万国，亲诸侯。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'XIAO XU',
      // 'Cname': '',
      'Num': [1, 1, 1, 0, 1, 1],
      'Compare': '7 : 3', //主客实力对比
      'Symbol': 'Upper wind, lower sky',
      'Feature': 'being Patience and accumulation',
      'Word':
          'The time is not yet ripe, we should be patient and active to accumulate our strength, and we must not take risks.',
      'Intro': '风行天上，"小畜"；君子以懿文德。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'LV',
      // 'Cname': '',
      'Num': [1, 1, 0, 1, 1, 1],
      'Compare': '6 : 7', //主客实力对比
      'Symbol': 'Upper sky, lower pool',
      'Feature': 'Reasonable and polite',
      'Word':
          'In interpersonal communication, people can turn bad things into good things as long as they can be healthy.',
      'Intro': '上天下泽，"履"；君子以辩上下，定民志。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'TAI',
      // 'Cname': '',
      'Num': [1, 1, 1, 0, 0, 0],
      'Compare': '7 : 0', //主客实力对比
      'Symbol': 'Upper earth, lower sky',
      'Feature': 'Interactive and communicate',
      'Word':
          'The effort is small, the return is large, auspicious, and smooth.',
      'Intro': '天地交，泰；后以财成天地之道，辅相天地之宜，以左右民。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'PI',
      // 'Cname': '',
      'Num': [0, 0, 0, 1, 1, 1],
      'Compare': '0 : 7', //主客实力对比
      'Symbol': 'Upper sky, lower earth',
      'Feature': 'Occlude and chaos',
      'Word':
          'People must be cautious, concentrate their strength, seize the opportunity, and give a dead hit.',
      'Intro': '天地不交，“否”；君子以俭德辟难，不可荣以禄。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'TONG REN',
      // 'Cname': '',
      'Num': [1, 0, 1, 1, 1, 1],
      'Compare': '5 : 7', //主客实力对比
      'Symbol': 'Upper sky, lower fire',
      'Feature': 'Coexist',
      'Word':
          'desert the private opinions, and keep the same general direction with everyone instead of minor differences.',
      'Intro': '天与火，同人；君子以类族辨物。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'DA YOU',
      // 'Cname': '',
      'Num': [1, 1, 1, 1, 0, 1],
      'Compare': '7 : 5', //主客实力对比
      'Symbol': 'Upper fire, lower sky',
      'Feature': 'Tolerant and rich',
      'Word': 'Be tolerant to diversity, tolerance is a virtue.',
      'Intro': '火在天上，“大有“；君子以遏恶扬善，顺天休命。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'QIAN',
      // 'Cname': '',
      'Num': [0, 0, 1, 0, 0, 0],
      'Compare': '1 : 0', //主客实力对比
      'Symbol': 'Upper earth, lower mountain',
      'Feature': 'Humble and sincere',
      'Word': 'A gentleman with modesty can do everything well.',
      'Intro': '地中有山，谦。君子以裒多益寡，称物平施。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'YU',
      // 'Cname': '',
      'Num': [0, 0, 0, 1, 0, 0],
      'Compare': '0 : 4', //主客实力对比
      'Symbol': 'Upper , lower ',
      'Feature': 'Hesitations, doubts and predictions',
      'Word':
          'The connect knowledge with actions. Avoid bad results cause by uncertain opinions and lack of opinion.',
      'Intro': '雷出地奋，豫。先王以作乐崇德，殷荐之上帝，以配祖考。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'SUI',
      // 'Cname': '',
      'Num': [1, 0, 0, 1, 1, 0],
      'Compare': '4 : 6', //主客实力对比
      'Symbol': 'Upper pool, lower thunder',
      'Feature': 'Adapt at any time',
      'Word':
          'Follow each other and obey each other. There are principles and conditions to follow the trend at any time.',
      'Intro': '泽中有雷，随；君子以向晦入宴息。',
      'Evaluation': '',
    },
    {
      'Name': 'GU',
      // 'Cname': '',
      'Num': [0, 1, 1, 0, 0, 1],
      'Compare': '3 : 1', //主客实力对比
      'Symbol': 'Upper mountain, lower wind',
      'Feature': 'Refresh',
      'Word':
          'It is necessary to innovate and create, manage and rectify, save the crisis, and revitalize the cause.',
      'Intro': '山下有风，蛊；君子以振民育德。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'Lin',
      // 'Cname': '',
      'Num': [1, 1, 0, 0, 0, 0],
      'Compare': '3 : 0', //主客实力对比
      'Symbol': 'Upper earth, lower pool',
      'Feature': 'Teach and protect',
      'Word':
          'Always cherish fear and be prepared for danger in times of peace.',
      'Intro': '泽上有地，临；君子以教思无穷，容保民无疆。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'GUAN',
      // 'Cname': '',
      'Num': [0, 0, 0, 0, 1, 1],
      'Compare': '0 : 3', //主客实力对比
      'Symbol': 'Upper wind, lower earth',
      'Feature': 'Passive and blocking',
      'Word':
          'Those who are above see the world with morality and justice; those who are below see above with admiration.',
      'Intro': '风行地上，观；先王以省方观民设教。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'SHI KE',
      // 'Cname': '',
      'Num': [1, 0, 0, 1, 0, 1],
      'Compare': '4 : 5', //主客实力对比
      'Symbol': 'Upper fire, lower thunder',
      'Feature': 'Rigid and soft',
      'Word': 'Combination of leniency and strictness, strength and softness.',
      'Intro': '雷电，噬磕；先王以明罚赤法。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'BI',
      // 'Cname': '',
      'Num': [1, 0, 1, 0, 0, 1],
      'Compare': '5 : 1', //主客实力对比
      'Symbol': 'Upper mountain, lower fire',
      'Feature': 'Civilization',
      'Word':
          'The ritual system is used to maintain the existing social order.',
      'Intro': '山下有火，贲；君子以明庶政，无敢折狱。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'BO',
      // 'Cname': '',
      'Num': [0, 0, 0, 0, 0, 1],
      'Compare': '0 : 1', //主客实力对比
      'Symbol': 'Upper earth, lower mountain',
      'Feature': 'Negative increase and Positive decrease',
      'Word': 'It is at a time when it is turning from prosperity to decline.',
      'Intro': '山附于地，剥；上以厚下安宅。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'FU',
      // 'Cname': '',
      'Num': [1, 0, 0, 0, 0, 0],
      'Compare': '4 : 0', //主客实力对比
      'Symbol': 'Upper earth, lower thunder',
      'Feature': 'Natural',
      'Word':
          'Before the error is serious, reflect and improve in time, otherwise it will be hard to return.',
      'Intro': '雷在地中，复；先王以至日闭关，商旅不行，后不省方。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'WU WANG',
      // 'Cname': '',
      'Num': [1, 0, 0, 1, 1, 1],
      'Compare': '4 : 7', //主客实力对比
      'Symbol': 'Upper sky, lower thunder',
      'Feature': 'Inspire',
      'Word': 'People are excited, and there will be gains.',
      'Intro': '天下雷行，物与无妄；先王以茂对时育万物。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'DA XU',
      // 'Cname': '',
      'Num': [1, 1, 1, 0, 0, 1],
      'Compare': '7 : 1', //主客实力对比
      'Symbol': 'Upper mountain, lower sky',
      'Feature': 'Improve',
      'Word':
          'Don\'t be afraid of difficulties and obstacles, and strive to improve yourself.',
      'Intro': '天在山中，大畜；君子以多识前言往行，以畜其德。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'YI',
      // 'Cname': '',
      'Num': [1, 0, 0, 0, 0, 1],
      'Compare': '4 : 1', //主客实力对比
      'Symbol': 'Upper mountain, lower thunder',
      'Feature': 'Cultivate',
      'Word':
          'Warm spring to nurture all things, nurture the virtuous and the people in time.',
      'Intro': '山下有雷，君子以慎言语，节饮食。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'DA GUO',
      // 'Cname': '',
      'Num': [0, 1, 1, 1, 1, 0],
      'Compare': '3 : 6', //主客实力对比
      'Symbol': 'Upper pool, lower wind (wood)',
      'Feature': 'Excessive',
      'Word': 'The water flows over the trees, the image of the flood.',
      'Intro': '泽灭木，大过；君子以独立不惧，遯世无闷。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'KAN',
      // 'Cname': '',
      'Num': [0, 1, 0, 0, 1, 0],
      'Compare': '2 : 2', //主客实力对比
      'Symbol': 'Upper water, lower water',
      'Feature': 'Dangerous',
      'Word': 'Risks add to risks, and there are many obstacles.',
      'Intro': '水洊至，习坎；君子以常德行，习教事。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'LI',
      // 'Cname': '',
      'Num': [1, 0, 1, 1, 0, 1],
      'Compare': '5 : 5', //主客实力对比
      'Symbol': 'Upper fire, lower fire',
      'Feature': 'Bright',
      'Word': 'Respect each other and compete with each other.',
      'Intro': '明两作，离；大人以继明照于四方。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'XIAN',
      // 'Cname': '',
      'Num': [0, 0, 1, 1, 1, 0],
      'Compare': '1 : 6', //主客实力对比
      'Symbol': 'Upper pool, lower mountain',
      'Feature': 'Feeling',
      'Word': 'Be good at accepting the opinions and opinions of others.',
      'Intro': '山上有泽，咸；君子以虚受人。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'HENG',
      // 'Cname': '',
      'Num': [0, 1, 1, 1, 0, 0],
      'Compare': '3 : 4', //主客实力对比
      'Symbol': 'Upper thunder, lower wind',
      'Feature': 'Perseverance',
      'Word': 'Persist in doing one thing will be rewarded.',
      'Intro': '雷风，恒；君子以立不易方。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'DUN',
      // 'Cname': '',
      'Num': [0, 0, 1, 1, 1, 1],
      'Compare': '1 : 7', //主客实力对比
      'Symbol': 'Upper sky, lower mountain',
      'Feature': 'Hide',
      'Word':
          'The bad guys are in power, and the good guys lose their advantageous position.',
      'Intro': '天下有山，遯；君子以远小人，不恶而严。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'DA ZHUANG',
      // 'Cname': '',
      'Num': [1, 1, 1, 1, 0, 0],
      'Compare': '0 : 1', //主客实力对比
      'Symbol': 'Upper thunder, lower sky',
      'Feature': 'Strong and force',
      'Word': 'The climate is warm and everything grows.',
      'Intro': '雷在天上，大壮；君子以非礼弗履。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'JIN',
      // 'Cname': '',
      'Num': [0, 0, 0, 1, 0, 1],
      'Compare': '0 : 5', //主客实力对比
      'Symbol': 'Upper fire, lower earth',
      'Feature': 'Promotion',
      'Word':
          'The sun illuminates the earth, and everything grows on the earth.',
      'Intro': '明出地上，晋；君子以自昭明德。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'MING YI',
      // 'Cname': '',
      'Num': [1, 0, 1, 0, 0, 0],
      'Compare': '5 : 0', //主客实力对比
      'Symbol': 'Upper , lower ',
      'Feature': 'Disappointed',
      'Word': 'The earth darkens after sunset, and the future is uncertain.',
      'Intro': '明入地中，“明夷”；君子以莅众，用晦而明。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'JIA REN',
      // 'Cname': '',
      'Num': [1, 0, 1, 0, 1, 1],
      'Compare': '5 : 3', //主客实力对比
      'Symbol': 'Upper wind, lower fire',
      'Feature': 'Management',
      'Word':
          'Everything should be internally oriented and then extended to the outside.',
      'Intro': '风自火出，家人；君子以言有物而行有恒。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'KUI',
      // 'Cname': '',
      'Num': [1, 1, 0, 1, 0, 1],
      'Compare': '6 : 5', //主客实力对比
      'Symbol': 'Upper fire, lower pool',
      'Feature': 'Contradiction',
      'Word': 'Everything is different, must be different and contradictory.',
      'Intro': '上火下泽，睽；君子以同而异。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'JIAN',
      // 'Cname': '',
      'Num': [0, 0, 1, 0, 1, 0],
      'Compare': '1 : 2', //主客实力对比
      'Symbol': 'Upper water, lower mountain',
      'Feature': 'Suffering',
      'Word':
          'The mountains are high and the water is deep, and there are many difficulties.',
      'Intro': '山上有水，蹇；君子以反身修德。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'XIE',
      // 'Cname': '',
      'Num': [0, 1, 0, 1, 0, 0],
      'Compare': '2 : 4', //主客实力对比
      'Symbol': 'Upper thunder, lower water',
      'Feature': 'Dismiss',
      'Word': 'When difficulties arise, we should try to resolve them.',
      'Intro': '雷雨作，解；君子以赦过宥罪。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'SUN',
      // 'Cname': '',
      'Num': [1, 1, 0, 0, 0, 1],
      'Compare': '6 : 1', //主客实力对比
      'Symbol': 'Upper mountain, lower pool',
      'Feature': 'Balance',
      'Word': 'Lose the bottom and benefit the top',
      'Intro': '山下有泽，损；君子以惩忿窒欲。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'YI',
      // 'Cname': '',
      'Num': [1, 0, 0, 0, 1, 1],
      'Compare': '4 : 3', //主客实力对比
      'Symbol': 'Upper wind, lower thunder',
      'Feature': 'Benefit',
      'Word': 'Lose the top and benefit the bottom',
      'Intro': '风雷，益；君子以见善则迁，有过则改。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'GUAI',
      // 'Cname': '',
      'Num': [1, 1, 1, 1, 1, 0],
      'Compare': '0 : 1', //主客实力对比
      'Symbol': 'Upper pool, lower sky',
      'Feature': 'Decision',
      'Word': 'Rain showers the earth and nourishes everything.',
      'Intro': '泽上于天，夬；君子以施禄及下，居德则忌。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'GOU',
      // 'Cname': '',
      'Num': [0, 1, 1, 1, 1, 1],
      'Compare': '3 : 7', //主客实力对比
      'Symbol': 'Upper sky, lower wind',
      'Feature': 'Meeting',
      'Word': 'Blowing all over the earth, the climate is harmonious.',
      'Intro': '天下有风，姤；后以施命诰四方。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'CUI',
      // 'Cname': '',
      'Num': [0, 0, 0, 1, 1, 0],
      'Compare': '0 : 6', //主客实力对比
      'Symbol': 'Upper pool, lower earth',
      'Feature': 'Clustering',
      'Word':
          'Many people struggle with each other, and crises will be pervasive.',
      'Intro': '泽上于地，萃；君子以除戎器，戎不虞。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'SHENG',
      // 'Cname': '',
      'Num': [0, 1, 1, 0, 0, 0],
      'Compare': '3 : 0', //主客实力对比
      'Symbol': 'Upper earth, lower wind (wood)',
      'Feature': 'Modesty',
      'Word':
          'The earth grows trees, and gradually grows, becoming taller and more useful.',
      'Intro': '地中生木，升；君子以顺德，积小以高大。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'KUN',
      // 'Cname': '',
      'Num': [0, 1, 0, 1, 1, 0],
      'Compare': '2 : 6', //主客实力对比
      'Symbol': 'Upper pool, lower water',
      'Feature': 'Dilemma',
      'Word':
          'The wisdom of a wise man is difficult to practice and he is in a trap.',
      'Intro': '泽无水，困；君子以致命遂志。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'JING',
      // 'Cname': '',
      'Num': [0, 1, 1, 0, 1, 0],
      'Compare': '3 : 2', //主客实力对比
      'Symbol': 'Upper water, lower wind',
      'Feature': 'Hiring',
      'Word':
          'The trees thrive in water. People live by wells, which are dug by people',
      'Intro': '木上有水，井；君子以劳民劝相。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'GE',
      // 'Cname': '',
      'Num': [1, 0, 1, 1, 1, 0],
      'Compare': '5 : 6', //主客实力对比
      'Symbol': 'Upper , lower ',
      'Feature': 'Transform',
      'Word':
          'The two coexist and restrain each other, and there is bound to be change.',
      'Intro': '泽中有火，革；君子以治历明时。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'DING',
      // 'Cname': '',
      'Num': [0, 1, 1, 1, 0, 1],
      'Compare': '3 : 5', //主客实力对比
      'Symbol': 'Upper fire, lower wind',
      'Feature': 'Remove the old',
      'Word': 'Keep a steady state and change with the plan.',
      'Intro': '木上有火，鼎，君子以正位凝命。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'ZHEN',
      // 'Cname': '',
      'Num': [1, 0, 0, 1, 0, 0],
      'Compare': '4 : 4', //主客实力对比
      'Symbol': 'Upper thunder, lower thunder',
      'Feature': 'Dynamic',
      'Word':
          'Preparing early, even in the face of sudden incidents, you can feel at ease.',
      'Intro': '洊雷，震；君子以恐惧修省。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'GEN',
      // 'Cname': '',
      'Num': [0, 0, 0, 0, 0, 1],
      'Compare': '0 : 1', //主客实力对比
      'Symbol': 'Upper mountain, lower mountain',
      'Feature': 'Static',
      'Word': 'After the climax, it will enter a relatively static phase.',
      'Intro': '兼山，艮；君子以思不出其位。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'JIAN',
      // 'Cname': '',
      'Num': [0, 0, 1, 0, 1, 1],
      'Compare': '1 : 3', //主客实力对比
      'Symbol': 'Upper wind, lower mountain',
      'Feature': 'Progressive',
      'Word':
          'This is a process of gradual progress, gradually moving forward without rushing.',
      'Intro': '山上有木，渐；君子以居贤德善俗。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'GUI MEI',
      // 'Cname': '',
      'Num': [1, 1, 0, 1, 0, 0],
      'Compare': '6 : 4', //主客实力对比
      'Symbol': 'Upper thunder, lower pool',
      'Feature': 'Rashly',
      'Word':
          'The eagerness for success caused things to develop in a bad direction.',
      'Intro': '泽上有雷，归妹，君子以永终知敝。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'FENG',
      // 'Cname': '',
      'Num': [1, 0, 1, 1, 0, 0],
      'Compare': '5 : 4', //主客实力对比
      'Symbol': 'Upper thunder, lower fire',
      'Feature': 'Enough',
      'Word': 'When things reach the top, they fall back',
      'Intro': '雷电皆至，丰；君子以折狱致刑。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'LV',
      // 'Cname': '',
      'Num': [0, 0, 1, 1, 0, 1],
      'Compare': '1 : 5', //主客实力对比
      'Symbol': 'Upper fire, lower mountain',
      'Feature': 'Prevent',
      'Word':
          'The fire was burning in the mountains, and the fire continued to spread forward.',
      'Intro': '山上有火，旅；君子以明慎用刑，而不留狱。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'XU',
      // 'Cname': '',
      'Num': [1, 1, 0, 1, 1, 0],
      'Compare': '6 : 6', //主客实力对比
      'Symbol': 'Upper pool, lower pool',
      'Feature': 'Follow',
      'Word': 'Humble attitude and behavior are profitable.',
      'Intro': '随风，巽；君子以申命行事。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'DUI',
      // 'Cname': '',
      'Num': [0, 0, 0, 0, 0, 1],
      'Compare': '0 : 1', //主客实力对比
      'Symbol': 'Upper , lower ',
      'Feature': 'Rigid inside and soft outside',
      'Word':
          'The two waters communicate with each other, unite as one like friends help each other.',
      'Intro': '丽泽，兑；君子以朋友讲习。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'HUAN',
      // 'Cname': '',
      'Num': [0, 1, 0, 0, 1, 1],
      'Compare': '2 : 3', //主客实力对比
      'Symbol': 'Upper wind, lower water',
      'Feature': 'Slack',
      'Word':
          'Flowing water symbolizes organization and disintegration of people.',
      'Intro': '风行水上，“涣”；先王以享于帝立庙。',
      'Evaluation': 'bilateral',
    },
    {
      'Name': 'JIE',
      // 'Cname': '',
      'Num': [1, 1, 0, 0, 1, 0],
      'Compare': '6 : 2', //主客实力对比
      'Symbol': 'Upper water, lower pool',
      'Feature': 'Control',
      'Word': 'There is water is limited or it will overflow outside the pool.',
      'Intro': '泽上有水，节；君子以制数度，议德行。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'ZHONG FU',
      // 'Cname': '',
      'Num': [1, 1, 0, 0, 1, 1],
      'Compare': '6 : 3', //主客实力对比
      'Symbol': 'Upper pool, lower wind',
      'Feature': 'Integrity',
      'Word': 'Integrity in Heart.',
      'Intro': '泽上有风，中孚；君子以议狱缓死。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'XIAO GUO',
      // 'Cname': '',
      'Num': [0, 0, 1, 1, 0, 0],
      'Compare': '1 : 4', //主客实力对比
      'Symbol': 'Upper thunder, lower mountain',
      'Feature': 'Pass',
      'Word': 'A little bit out of bounds',
      'Intro': '山上有雷，小过；君子以行过乎恭，丧过乎哀，用过乎俭。',
      'Evaluation': 'Negative',
    },
    {
      'Name': 'JI JI',
      // 'Cname': '',
      'Num': [1, 0, 1, 0, 1, 0],
      'Compare': '5 : 2', //主客实力对比
      'Symbol': 'Upper water, lower fire',
      'Feature': 'Success',
      'Word': 'Things have succeeded, but things will change eventually.',
      'Intro': '水在火上，既济；君子以思患而预防之。',
      'Evaluation': 'Positive',
    },
    {
      'Name': 'WEI JI',
      // 'Cname': '',
      'Num': [0, 1, 0, 1, 0, 1],
      'Compare': '2 : 5', //主客实力对比
      'Symbol': 'Upper fire, lower water',
      'Feature': 'Unsuccess',
      'Word': 'The matter is not over yet, and it will move forward.',
      'Intro': '火在水上，未济；君子以慎辨物居方。',
      'Evaluation': 'Negative',
    },
  ];

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: hexagramNumList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 2,
          child: ListTile(
              leading: Icon(
                Icons.chevron_right,
                size: 40,
              ),
              title: Text(
                hexagramNumList[index]['Name'] as String,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(hexagramNumList[index]['Symbol'] as String),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HexDetail(hexagramNumList[index], index)),
                );
              }),
        );
      },
    );
  }
}
