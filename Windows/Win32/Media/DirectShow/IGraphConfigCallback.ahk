#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IGraphConfigCallback interface contains the callback method passed to IGraphConfig::Reconfigure. The caller (an application or filter) implements this interface. For more information, see IGraphConfig.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-igraphconfigcallback
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IGraphConfigCallback extends IUnknown{
    /**
     * The interface identifier for IGraphConfigCallback
     * @type {Guid}
     */
    static IID => Guid("{ade0fd60-d19d-11d2-abf6-00a0c905f375}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<Void>} pvContext 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Reconfigure(pvContext, dwFlags) {
        result := ComCall(3, this, "ptr", pvContext, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
