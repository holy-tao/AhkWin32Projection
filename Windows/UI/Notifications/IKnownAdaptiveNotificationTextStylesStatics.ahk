#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Notifications
 * @version WindowsRuntime 1.4
 */
class IKnownAdaptiveNotificationTextStylesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownAdaptiveNotificationTextStylesStatics
     * @type {Guid}
     */
    static IID => Guid("{202192d7-8996-45aa-8ba1-d461d72c2a1b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Caption", "get_Body", "get_Base", "get_Subtitle", "get_Title", "get_Subheader", "get_Header", "get_TitleNumeral", "get_SubheaderNumeral", "get_HeaderNumeral", "get_CaptionSubtle", "get_BodySubtle", "get_BaseSubtle", "get_SubtitleSubtle", "get_TitleSubtle", "get_SubheaderSubtle", "get_SubheaderNumeralSubtle", "get_HeaderSubtle", "get_HeaderNumeralSubtle"]

    /**
     * @type {HSTRING} 
     */
    Caption {
        get => this.get_Caption()
    }

    /**
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
    }

    /**
     * @type {HSTRING} 
     */
    Base {
        get => this.get_Base()
    }

    /**
     * @type {HSTRING} 
     */
    Subtitle {
        get => this.get_Subtitle()
    }

    /**
     * @type {HSTRING} 
     */
    Title {
        get => this.get_Title()
    }

    /**
     * @type {HSTRING} 
     */
    Subheader {
        get => this.get_Subheader()
    }

    /**
     * @type {HSTRING} 
     */
    Header {
        get => this.get_Header()
    }

    /**
     * @type {HSTRING} 
     */
    TitleNumeral {
        get => this.get_TitleNumeral()
    }

    /**
     * @type {HSTRING} 
     */
    SubheaderNumeral {
        get => this.get_SubheaderNumeral()
    }

    /**
     * @type {HSTRING} 
     */
    HeaderNumeral {
        get => this.get_HeaderNumeral()
    }

    /**
     * @type {HSTRING} 
     */
    CaptionSubtle {
        get => this.get_CaptionSubtle()
    }

    /**
     * @type {HSTRING} 
     */
    BodySubtle {
        get => this.get_BodySubtle()
    }

    /**
     * @type {HSTRING} 
     */
    BaseSubtle {
        get => this.get_BaseSubtle()
    }

    /**
     * @type {HSTRING} 
     */
    SubtitleSubtle {
        get => this.get_SubtitleSubtle()
    }

    /**
     * @type {HSTRING} 
     */
    TitleSubtle {
        get => this.get_TitleSubtle()
    }

    /**
     * @type {HSTRING} 
     */
    SubheaderSubtle {
        get => this.get_SubheaderSubtle()
    }

    /**
     * @type {HSTRING} 
     */
    SubheaderNumeralSubtle {
        get => this.get_SubheaderNumeralSubtle()
    }

    /**
     * @type {HSTRING} 
     */
    HeaderSubtle {
        get => this.get_HeaderSubtle()
    }

    /**
     * @type {HSTRING} 
     */
    HeaderNumeralSubtle {
        get => this.get_HeaderNumeralSubtle()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Caption() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Base() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subtitle() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Title() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subheader() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Header() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TitleNumeral() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SubheaderNumeral() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HeaderNumeral() {
        value := HSTRING()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CaptionSubtle() {
        value := HSTRING()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BodySubtle() {
        value := HSTRING()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_BaseSubtle() {
        value := HSTRING()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SubtitleSubtle() {
        value := HSTRING()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TitleSubtle() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SubheaderSubtle() {
        value := HSTRING()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SubheaderNumeralSubtle() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HeaderSubtle() {
        value := HSTRING()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_HeaderNumeralSubtle() {
        value := HSTRING()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
