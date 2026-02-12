#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TextSegment.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AlternateWordForm.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Text
 * @version WindowsRuntime 1.4
 */
class IWordSegment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWordSegment
     * @type {Guid}
     */
    static IID => Guid("{d2d4ba6d-987c-4cc0-b6bd-d49a11b38f9a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Text", "get_SourceTextSegment", "get_AlternateForms"]

    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
    }

    /**
     * @type {TextSegment} 
     */
    SourceTextSegment {
        get => this.get_SourceTextSegment()
    }

    /**
     * @type {IVectorView<AlternateWordForm>} 
     */
    AlternateForms {
        get => this.get_AlternateForms()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TextSegment} 
     */
    get_SourceTextSegment() {
        value := TextSegment()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<AlternateWordForm>} 
     */
    get_AlternateForms() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(AlternateWordForm, value)
    }
}
