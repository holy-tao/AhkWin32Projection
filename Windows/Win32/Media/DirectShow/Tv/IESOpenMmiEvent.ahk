#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IESEvent.ahk

/**
 * Gets information from an OpenMMI event.
 * @remarks
 * 
  * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IESOpenMmiEvent)</c>.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//tuner/nn-tuner-iesopenmmievent
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IESOpenMmiEvent extends IESEvent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IESOpenMmiEvent
     * @type {Guid}
     */
    static IID => Guid("{ba4b6526-1a35-4635-8b56-3ec612746a8c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDialogNumber", "GetDialogType", "GetDialogData", "GetDialogStringData"]

    /**
     * 
     * @param {Pointer<Integer>} pDialogRequest 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesopenmmievent-getdialognumber
     */
    GetDialogNumber(pDialogRequest) {
        pDialogRequestMarshal := pDialogRequest is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pDialogRequestMarshal, pDialogRequest, "uint*", &pDialogNumber := 0, "HRESULT")
        return pDialogNumber
    }

    /**
     * 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesopenmmievent-getdialogtype
     */
    GetDialogType() {
        guidDialogType := Guid()
        result := ComCall(9, this, "ptr", guidDialogType, "HRESULT")
        return guidDialogType
    }

    /**
     * 
     * @returns {Pointer<SAFEARRAY>} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesopenmmievent-getdialogdata
     */
    GetDialogData() {
        result := ComCall(10, this, "ptr*", &pbData := 0, "HRESULT")
        return pbData
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBaseUrl 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesopenmmievent-getdialogstringdata
     */
    GetDialogStringData(pbstrBaseUrl) {
        pbstrData := BSTR()
        result := ComCall(11, this, "ptr", pbstrBaseUrl, "ptr", pbstrData, "HRESULT")
        return pbstrData
    }
}
