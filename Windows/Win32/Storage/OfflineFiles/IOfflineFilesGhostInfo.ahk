#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents the ghosting status of an item in the Offline Files cache.
 * @see https://docs.microsoft.com/windows/win32/api//cscobj/nn-cscobj-iofflinefilesghostinfo
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class IOfflineFilesGhostInfo extends IUnknown{
    /**
     * The interface identifier for IOfflineFilesGhostInfo
     * @type {Guid}
     */
    static IID => Guid("{2b09d48c-8ab5-464f-a755-a59d92f99429}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<BOOL>} pbGhosted 
     * @returns {HRESULT} 
     */
    IsGhosted(pbGhosted) {
        result := ComCall(3, this, "ptr", pbGhosted, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
