#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_REGISTER_NAME extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRax => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRcx => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRdx => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRbx => 3

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRsp => 4

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRbp => 5

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRsi => 6

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRdi => 7

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterR8 => 8

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterR9 => 9

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterR10 => 10

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterR11 => 11

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterR12 => 12

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterR13 => 13

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterR14 => 14

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterR15 => 15

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRip => 16

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterRflags => 17

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterEs => 18

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterCs => 19

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterSs => 20

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterDs => 21

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFs => 22

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterGs => 23

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterLdtr => 24

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterTr => 25

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterIdtr => 26

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterGdtr => 27

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterCr0 => 28

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterCr2 => 29

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterCr3 => 30

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterCr4 => 31

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterCr8 => 32

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterDr0 => 33

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterDr1 => 34

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterDr2 => 35

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterDr3 => 36

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterDr6 => 37

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterDr7 => 38

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXCr0 => 39

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterVirtualCr0 => 40

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterVirtualCr3 => 41

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterVirtualCr4 => 42

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterVirtualCr8 => 43

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm0 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm1 => 4097

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm2 => 4098

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm3 => 4099

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm4 => 4100

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm5 => 4101

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm6 => 4102

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm7 => 4103

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm8 => 4104

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm9 => 4105

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm10 => 4106

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm11 => 4107

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm12 => 4108

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm13 => 4109

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm14 => 4110

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmm15 => 4111

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFpMmx0 => 4112

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFpMmx1 => 4113

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFpMmx2 => 4114

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFpMmx3 => 4115

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFpMmx4 => 4116

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFpMmx5 => 4117

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFpMmx6 => 4118

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFpMmx7 => 4119

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterFpControlStatus => 4120

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXmmControlStatus => 4121

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterTsc => 8192

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterEfer => 8193

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterKernelGsBase => 8194

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicBase => 8195

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterPat => 8196

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterSysenterCs => 8197

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterSysenterEip => 8198

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterSysenterEsp => 8199

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterStar => 8200

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterLstar => 8201

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterCstar => 8202

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterSfmask => 8203

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterInitialApicId => 8204

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrCap => 8205

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrDefType => 8206

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase0 => 8208

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase1 => 8209

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase2 => 8210

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase3 => 8211

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase4 => 8212

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase5 => 8213

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase6 => 8214

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase7 => 8215

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase8 => 8216

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBase9 => 8217

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBaseA => 8218

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBaseB => 8219

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBaseC => 8220

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBaseD => 8221

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBaseE => 8222

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysBaseF => 8223

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask0 => 8256

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask1 => 8257

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask2 => 8258

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask3 => 8259

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask4 => 8260

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask5 => 8261

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask6 => 8262

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask7 => 8263

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask8 => 8264

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMask9 => 8265

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMaskA => 8266

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMaskB => 8267

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMaskC => 8268

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMaskD => 8269

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMaskE => 8270

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrPhysMaskF => 8271

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix64k00000 => 8304

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix16k80000 => 8305

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix16kA0000 => 8306

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix4kC0000 => 8307

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix4kC8000 => 8308

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix4kD0000 => 8309

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix4kD8000 => 8310

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix4kE0000 => 8311

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix4kE8000 => 8312

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix4kF0000 => 8313

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMsrMtrrFix4kF8000 => 8314

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterTscAux => 8315

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterBndcfgs => 8316

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterMCount => 8318

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterACount => 8319

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterSpecCtrl => 8324

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterPredCmd => 8325

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterTscVirtualOffset => 8327

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterTsxCtrl => 8328

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXss => 8331

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterUCet => 8332

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterSCet => 8333

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterSsp => 8334

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterPl0Ssp => 8335

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterPl1Ssp => 8336

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterPl2Ssp => 8337

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterPl3Ssp => 8338

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterInterruptSspTableAddr => 8339

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterTscDeadline => 8341

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterTscAdjust => 8342

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterUmwaitControl => 8344

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXfd => 8345

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterXfdErr => 8346

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicId => 12290

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicVersion => 12291

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicTpr => 12296

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicPpr => 12298

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicEoi => 12299

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicLdr => 12301

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicSpurious => 12303

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIsr0 => 12304

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIsr1 => 12305

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIsr2 => 12306

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIsr3 => 12307

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIsr4 => 12308

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIsr5 => 12309

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIsr6 => 12310

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIsr7 => 12311

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicTmr0 => 12312

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicTmr1 => 12313

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicTmr2 => 12314

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicTmr3 => 12315

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicTmr4 => 12316

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicTmr5 => 12317

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicTmr6 => 12318

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicTmr7 => 12319

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIrr0 => 12320

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIrr1 => 12321

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIrr2 => 12322

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIrr3 => 12323

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIrr4 => 12324

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIrr5 => 12325

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIrr6 => 12326

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIrr7 => 12327

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicEse => 12328

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicIcr => 12336

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicLvtTimer => 12338

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicLvtThermal => 12339

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicLvtPerfmon => 12340

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicLvtLint0 => 12341

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicLvtLint1 => 12342

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicLvtError => 12343

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicInitCount => 12344

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicCurrentCount => 12345

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicDivide => 12350

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterApicSelfIpi => 12351

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint0 => 16384

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint1 => 16385

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint2 => 16386

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint3 => 16387

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint4 => 16388

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint5 => 16389

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint6 => 16390

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint7 => 16391

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint8 => 16392

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint9 => 16393

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint10 => 16394

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint11 => 16395

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint12 => 16396

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint13 => 16397

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint14 => 16398

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSint15 => 16399

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterScontrol => 16400

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSversion => 16401

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSiefp => 16402

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterSimp => 16403

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterEom => 16404

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterVpRuntime => 20480

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterHypercall => 20481

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterGuestOsId => 20482

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterVpAssistPage => 20499

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterReferenceTsc => 20503

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterReferenceTscSequence => 20506

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterPendingInterruption => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterInterruptState => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterPendingEvent => -2147483646

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterDeliverabilityNotifications => -2147483644

    /**
     * @type {Integer (Int32)}
     */
    static WHvRegisterInternalActivityState => -2147483643

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64RegisterPendingDebugException => -2147483642
}
