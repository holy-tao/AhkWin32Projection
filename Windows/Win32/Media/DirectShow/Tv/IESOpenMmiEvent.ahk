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
     * 
     * @param {Pointer<UInt32>} pDialogRequest 
     * @param {Pointer<UInt32>} pDialogNumber 
     * @returns {HRESULT} 
     */
    GetDialogNumber(pDialogRequest, pDialogNumber) {
        result := ComCall(8, this, "uint*", pDialogRequest, "uint*", pDialogNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidDialogType 
     * @returns {HRESULT} 
     */
    GetDialogType(guidDialogType) {
        result := ComCall(9, this, "ptr", guidDialogType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SAFEARRAY>} pbData 
     * @returns {HRESULT} 
     */
    GetDialogData(pbData) {
        result := ComCall(10, this, "ptr", pbData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrBaseUrl 
     * @param {Pointer<BSTR>} pbstrData 
     * @returns {HRESULT} 
     */
    GetDialogStringData(pbstrBaseUrl, pbstrData) {
        result := ComCall(11, this, "ptr", pbstrBaseUrl, "ptr", pbstrData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
