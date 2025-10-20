#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMRegisterCallback interface enables the application to get status messages from a sink object.By default, the writer object does not send the application any status messages from the sink object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmregistercallback
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMRegisterCallback extends IUnknown{
    /**
     * The interface identifier for IWMRegisterCallback
     * @type {Guid}
     */
    static IID => Guid("{cf4b1f99-4de2-4e49-a363-252740d99bc1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IWMStatusCallback>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    Advise(pCallback, pvContext) {
        result := ComCall(3, this, "ptr", pCallback, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWMStatusCallback>} pCallback 
     * @param {Pointer<Void>} pvContext 
     * @returns {HRESULT} 
     */
    Unadvise(pCallback, pvContext) {
        result := ComCall(4, this, "ptr", pCallback, "ptr", pvContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
