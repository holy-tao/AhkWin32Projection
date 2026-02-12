#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\LanguageFont.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Globalization.Fonts
 * @version WindowsRuntime 1.4
 */
class ILanguageFontGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILanguageFontGroup
     * @type {Guid}
     */
    static IID => Guid("{f33a7fc3-3a5c-4aea-b9ff-b39fb242f7f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UITextFont", "get_UIHeadingFont", "get_UITitleFont", "get_UICaptionFont", "get_UINotificationHeadingFont", "get_TraditionalDocumentFont", "get_ModernDocumentFont", "get_DocumentHeadingFont", "get_FixedWidthTextFont", "get_DocumentAlternate1Font", "get_DocumentAlternate2Font"]

    /**
     * @type {LanguageFont} 
     */
    UITextFont {
        get => this.get_UITextFont()
    }

    /**
     * @type {LanguageFont} 
     */
    UIHeadingFont {
        get => this.get_UIHeadingFont()
    }

    /**
     * @type {LanguageFont} 
     */
    UITitleFont {
        get => this.get_UITitleFont()
    }

    /**
     * @type {LanguageFont} 
     */
    UICaptionFont {
        get => this.get_UICaptionFont()
    }

    /**
     * @type {LanguageFont} 
     */
    UINotificationHeadingFont {
        get => this.get_UINotificationHeadingFont()
    }

    /**
     * @type {LanguageFont} 
     */
    TraditionalDocumentFont {
        get => this.get_TraditionalDocumentFont()
    }

    /**
     * @type {LanguageFont} 
     */
    ModernDocumentFont {
        get => this.get_ModernDocumentFont()
    }

    /**
     * @type {LanguageFont} 
     */
    DocumentHeadingFont {
        get => this.get_DocumentHeadingFont()
    }

    /**
     * @type {LanguageFont} 
     */
    FixedWidthTextFont {
        get => this.get_FixedWidthTextFont()
    }

    /**
     * @type {LanguageFont} 
     */
    DocumentAlternate1Font {
        get => this.get_DocumentAlternate1Font()
    }

    /**
     * @type {LanguageFont} 
     */
    DocumentAlternate2Font {
        get => this.get_DocumentAlternate2Font()
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UITextFont() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UIHeadingFont() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UITitleFont() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UICaptionFont() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_UINotificationHeadingFont() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_TraditionalDocumentFont() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_ModernDocumentFont() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_DocumentHeadingFont() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_FixedWidthTextFont() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_DocumentAlternate1Font() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }

    /**
     * 
     * @returns {LanguageFont} 
     */
    get_DocumentAlternate2Font() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LanguageFont(value)
    }
}
