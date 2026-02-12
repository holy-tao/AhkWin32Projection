#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\INumeralSystemIdentifiersStatics.ahk
#Include .\INumeralSystemIdentifiersStatics2.ahk
#Include ..\..\Guid.ahk

/**
 * Contains the numeral system identifiers for the supported numeral systems, as static properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class NumeralSystemIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * Gets the identifier for the Arabic-Indic decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.arab
     * @type {HSTRING} 
     */
    static Arab {
        get => NumeralSystemIdentifiers.get_Arab()
    }

    /**
     * Gets the identifier for the Extended Arabic-Indic decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.arabext
     * @type {HSTRING} 
     */
    static ArabExt {
        get => NumeralSystemIdentifiers.get_ArabExt()
    }

    /**
     * Gets the identifier for the Balinese decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.bali
     * @type {HSTRING} 
     */
    static Bali {
        get => NumeralSystemIdentifiers.get_Bali()
    }

    /**
     * Gets the identifier for the Bangla decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.beng
     * @type {HSTRING} 
     */
    static Beng {
        get => NumeralSystemIdentifiers.get_Beng()
    }

    /**
     * Gets the identifier for the Cham decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.cham
     * @type {HSTRING} 
     */
    static Cham {
        get => NumeralSystemIdentifiers.get_Cham()
    }

    /**
     * Gets the identifier for the Devanagari decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.deva
     * @type {HSTRING} 
     */
    static Deva {
        get => NumeralSystemIdentifiers.get_Deva()
    }

    /**
     * Gets the identifier for the Latin decimal numeral system using full-width characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.fullwide
     * @type {HSTRING} 
     */
    static FullWide {
        get => NumeralSystemIdentifiers.get_FullWide()
    }

    /**
     * Gets the identifier for the Gujarati decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.gujr
     * @type {HSTRING} 
     */
    static Gujr {
        get => NumeralSystemIdentifiers.get_Gujr()
    }

    /**
     * Gets the identifier for the Gurmukhi decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.guru
     * @type {HSTRING} 
     */
    static Guru {
        get => NumeralSystemIdentifiers.get_Guru()
    }

    /**
     * Gets the identifier for the Han decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.hanidec
     * @type {HSTRING} 
     */
    static HaniDec {
        get => NumeralSystemIdentifiers.get_HaniDec()
    }

    /**
     * Gets the identifier for the Javanese decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.java
     * @type {HSTRING} 
     */
    static Java {
        get => NumeralSystemIdentifiers.get_Java()
    }

    /**
     * Gets the identifier for the Kayah Li decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.kali
     * @type {HSTRING} 
     */
    static Kali {
        get => NumeralSystemIdentifiers.get_Kali()
    }

    /**
     * Gets the identifier for the Khmer decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.khmr
     * @type {HSTRING} 
     */
    static Khmr {
        get => NumeralSystemIdentifiers.get_Khmr()
    }

    /**
     * Gets the identifier for the Kannada decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.knda
     * @type {HSTRING} 
     */
    static Knda {
        get => NumeralSystemIdentifiers.get_Knda()
    }

    /**
     * Gets the identifier for the Tai Tham Hora decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.lana
     * @type {HSTRING} 
     */
    static Lana {
        get => NumeralSystemIdentifiers.get_Lana()
    }

    /**
     * Gets the identifier for the Tai Tham Tham decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.lanatham
     * @type {HSTRING} 
     */
    static LanaTham {
        get => NumeralSystemIdentifiers.get_LanaTham()
    }

    /**
     * Gets the identifier for the Laoo decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.laoo
     * @type {HSTRING} 
     */
    static Laoo {
        get => NumeralSystemIdentifiers.get_Laoo()
    }

    /**
     * Gets the identifier for the Latin decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.latn
     * @type {HSTRING} 
     */
    static Latn {
        get => NumeralSystemIdentifiers.get_Latn()
    }

    /**
     * Gets the identifier for the Lepcha decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.lepc
     * @type {HSTRING} 
     */
    static Lepc {
        get => NumeralSystemIdentifiers.get_Lepc()
    }

    /**
     * Gets the identifier for the Limbu decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.limb
     * @type {HSTRING} 
     */
    static Limb {
        get => NumeralSystemIdentifiers.get_Limb()
    }

    /**
     * Gets the identifier for the Malayalam decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mlym
     * @type {HSTRING} 
     */
    static Mlym {
        get => NumeralSystemIdentifiers.get_Mlym()
    }

    /**
     * Gets the identifier for the Mongolian decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mong
     * @type {HSTRING} 
     */
    static Mong {
        get => NumeralSystemIdentifiers.get_Mong()
    }

    /**
     * Gets the identifier for the Meetei Mayek decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mtei
     * @type {HSTRING} 
     */
    static Mtei {
        get => NumeralSystemIdentifiers.get_Mtei()
    }

    /**
     * Gets the identifier for the Myanmar decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mymr
     * @type {HSTRING} 
     */
    static Mymr {
        get => NumeralSystemIdentifiers.get_Mymr()
    }

    /**
     * Gets the identifier for the Myanmar Shan decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mymrshan
     * @type {HSTRING} 
     */
    static MymrShan {
        get => NumeralSystemIdentifiers.get_MymrShan()
    }

    /**
     * Gets the identifier for the Nko decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.nkoo
     * @type {HSTRING} 
     */
    static Nkoo {
        get => NumeralSystemIdentifiers.get_Nkoo()
    }

    /**
     * Gets the identifier for the Ol Chiki decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.olck
     * @type {HSTRING} 
     */
    static Olck {
        get => NumeralSystemIdentifiers.get_Olck()
    }

    /**
     * Gets the identifier for the Odia decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.orya
     * @type {HSTRING} 
     */
    static Orya {
        get => NumeralSystemIdentifiers.get_Orya()
    }

    /**
     * Gets the identifier for the Saurashtra decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.saur
     * @type {HSTRING} 
     */
    static Saur {
        get => NumeralSystemIdentifiers.get_Saur()
    }

    /**
     * Gets the identifier for the Sundanese decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.sund
     * @type {HSTRING} 
     */
    static Sund {
        get => NumeralSystemIdentifiers.get_Sund()
    }

    /**
     * Gets the identifier for the New Tai Lue decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.talu
     * @type {HSTRING} 
     */
    static Talu {
        get => NumeralSystemIdentifiers.get_Talu()
    }

    /**
     * Gets the identifier for the Tamil decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.tamldec
     * @type {HSTRING} 
     */
    static TamlDec {
        get => NumeralSystemIdentifiers.get_TamlDec()
    }

    /**
     * Gets the identifier for the Telugu decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.telu
     * @type {HSTRING} 
     */
    static Telu {
        get => NumeralSystemIdentifiers.get_Telu()
    }

    /**
     * Gets the identifier for the Thai decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.thai
     * @type {HSTRING} 
     */
    static Thai {
        get => NumeralSystemIdentifiers.get_Thai()
    }

    /**
     * Gets the identifier for the Tibetan decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.tibt
     * @type {HSTRING} 
     */
    static Tibt {
        get => NumeralSystemIdentifiers.get_Tibt()
    }

    /**
     * Gets the identifier for the Vai decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.vaii
     * @type {HSTRING} 
     */
    static Vaii {
        get => NumeralSystemIdentifiers.get_Vaii()
    }

    /**
     * Gets the identifier for the Brahmi decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.brah
     * @type {HSTRING} 
     */
    static Brah {
        get => NumeralSystemIdentifiers.get_Brah()
    }

    /**
     * Gets the identifier for the Osmanya decimal numeral system.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.osma
     * @type {HSTRING} 
     */
    static Osma {
        get => NumeralSystemIdentifiers.get_Osma()
    }

    /**
     * Gets the identifier for the decimal numeral system using MathBold characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mathbold
     * @type {HSTRING} 
     */
    static MathBold {
        get => NumeralSystemIdentifiers.get_MathBold()
    }

    /**
     * Gets the identifier for the decimal numeral system using MathDbl characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mathdbl
     * @type {HSTRING} 
     */
    static MathDbl {
        get => NumeralSystemIdentifiers.get_MathDbl()
    }

    /**
     * Gets the identifier for the decimal numeral system using MathSans characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mathsans
     * @type {HSTRING} 
     */
    static MathSans {
        get => NumeralSystemIdentifiers.get_MathSans()
    }

    /**
     * Gets the identifier for the decimal numeral system using MathSanb characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mathsanb
     * @type {HSTRING} 
     */
    static MathSanb {
        get => NumeralSystemIdentifiers.get_MathSanb()
    }

    /**
     * Gets the identifier for the decimal numeral system using MathMono characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.mathmono
     * @type {HSTRING} 
     */
    static MathMono {
        get => NumeralSystemIdentifiers.get_MathMono()
    }

    /**
     * Gets the identifier for the decimal numeral system using ZmthBold (Mathematical notation) characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.zmthbold
     * @type {HSTRING} 
     */
    static ZmthBold {
        get => NumeralSystemIdentifiers.get_ZmthBold()
    }

    /**
     * Gets the identifier for the decimal numeral system using ZmthDbl (Mathematical notation) characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.zmthdbl
     * @type {HSTRING} 
     */
    static ZmthDbl {
        get => NumeralSystemIdentifiers.get_ZmthDbl()
    }

    /**
     * Gets the identifier for the decimal numeral system using ZmthSans (Mathematical notation) characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.zmthsans
     * @type {HSTRING} 
     */
    static ZmthSans {
        get => NumeralSystemIdentifiers.get_ZmthSans()
    }

    /**
     * Gets the identifier for the decimal numeral system using ZmthSanb (Mathematical notation) characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.zmthsanb
     * @type {HSTRING} 
     */
    static ZmthSanb {
        get => NumeralSystemIdentifiers.get_ZmthSanb()
    }

    /**
     * Gets the identifier for the decimal numeral system using ZmthMono (Mathematical notation) characters.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.numeralsystemidentifiers.zmthmono
     * @type {HSTRING} 
     */
    static ZmthMono {
        get => NumeralSystemIdentifiers.get_ZmthMono()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Arab() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Arab()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ArabExt() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_ArabExt()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Bali() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Bali()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Beng() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Beng()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Cham() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Cham()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Deva() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Deva()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_FullWide() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_FullWide()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Gujr() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Gujr()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Guru() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Guru()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_HaniDec() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_HaniDec()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Java() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Java()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Kali() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Kali()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Khmr() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Khmr()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Knda() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Knda()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Lana() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Lana()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_LanaTham() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_LanaTham()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Laoo() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Laoo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Latn() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Latn()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Lepc() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Lepc()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Limb() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Limb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mlym() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Mlym()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mong() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Mong()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mtei() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Mtei()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Mymr() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Mymr()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MymrShan() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_MymrShan()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Nkoo() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Nkoo()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Olck() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Olck()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Orya() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Orya()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Saur() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Saur()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Sund() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Sund()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Talu() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Talu()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TamlDec() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_TamlDec()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Telu() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Telu()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Thai() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Thai()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Tibt() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Tibt()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Vaii() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics := INumeralSystemIdentifiersStatics(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics.get_Vaii()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Brah() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_Brah()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_Osma() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_Osma()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MathBold() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_MathBold()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MathDbl() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_MathDbl()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MathSans() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_MathSans()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MathSanb() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_MathSanb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_MathMono() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_MathMono()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ZmthBold() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_ZmthBold()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ZmthDbl() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_ZmthDbl()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ZmthSans() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_ZmthSans()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ZmthSanb() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_ZmthSanb()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_ZmthMono() {
        if (!NumeralSystemIdentifiers.HasProp("__INumeralSystemIdentifiersStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.NumeralSystemIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, INumeralSystemIdentifiersStatics2.IID)
            NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2 := INumeralSystemIdentifiersStatics2(factoryPtr)
        }

        return NumeralSystemIdentifiers.__INumeralSystemIdentifiersStatics2.get_ZmthMono()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
