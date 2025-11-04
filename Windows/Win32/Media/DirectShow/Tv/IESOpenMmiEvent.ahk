#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pDialogNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesopenmmievent-getdialognumber
     */
    GetDialogNumber(pDialogRequest, pDialogNumber) {
        pDialogRequestMarshal := pDialogRequest is VarRef ? "uint*" : "ptr"
        pDialogNumberMarshal := pDialogNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, pDialogRequestMarshal, pDialogRequest, pDialogNumberMarshal, pDialogNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidDialogType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesopenmmievent-getdialogtype
     */
    GetDialogType(guidDialogType) {
        result := ComCall(9, this, "ptr", guidDialogType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<SAFEARRAY>>} pbData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesopenmmievent-getdialogdata
     */
    GetDialogData(pbData) {
        pbDataMarshal := pbData is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, pbDataMarshal, pbData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBaseUrl 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/tuner/nf-tuner-iesopenmmievent-getdialogstringdata
     */
    GetDialogStringData(pbstrBaseUrl, pbstrData) {
        result := ComCall(11, this, "ptr", pbstrBaseUrl, "ptr", pbstrData, "HRESULT")
        return result
    }
}
