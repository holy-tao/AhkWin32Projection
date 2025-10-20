#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class IMSAdminBaseSinkW extends IUnknown{
    /**
     * The interface identifier for IMSAdminBaseSinkW
     * @type {Guid}
     */
    static IID => Guid("{a9e69612-b80d-11d0-b9b9-00a0c922e750}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwMDNumElements 
     * @param {Pointer<MD_CHANGE_OBJECT_W>} pcoChangeList 
     * @returns {HRESULT} 
     */
    SinkNotify(dwMDNumElements, pcoChangeList) {
        result := ComCall(3, this, "uint", dwMDNumElements, "ptr", pcoChangeList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShutdownNotify() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
