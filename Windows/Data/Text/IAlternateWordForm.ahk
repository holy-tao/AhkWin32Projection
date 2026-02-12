#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\TextSegment.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class IAlternateWordForm extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAlternateWordForm
     * @type {Guid}
     */
    static IID => Guid("{47396c1e-51b9-4207-9146-248e636a1d1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceTextSegment", "get_AlternateText", "get_NormalizationFormat"]

    /**
     * @type {TextSegment} 
     */
    SourceTextSegment {
        get => this.get_SourceTextSegment()
    }

    /**
     * @type {HSTRING} 
     */
    AlternateText {
        get => this.get_AlternateText()
    }

    /**
     * @type {Integer} 
     */
    NormalizationFormat {
        get => this.get_NormalizationFormat()
    }

    /**
     * 
     * @returns {TextSegment} 
     */
    get_SourceTextSegment() {
        value := TextSegment()
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
    get_AlternateText() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NormalizationFormat() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
