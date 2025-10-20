#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to support volume shrinking.
 * @see https://docs.microsoft.com/windows/win32/api//vds/nn-vds-ivdsvolumeshrink
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class IVdsVolumeShrink extends IUnknown{
    /**
     * The interface identifier for IVdsVolumeShrink
     * @type {Guid}
     */
    static IID => Guid("{d68168c9-82a2-4f85-b6e9-74707c49a58f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt64>} pullMaxNumberOfReclaimableBytes 
     * @returns {HRESULT} 
     */
    QueryMaxReclaimableBytes(pullMaxNumberOfReclaimableBytes) {
        result := ComCall(3, this, "uint*", pullMaxNumberOfReclaimableBytes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ullDesiredNumberOfReclaimableBytes 
     * @param {Integer} ullMinNumberOfReclaimableBytes 
     * @param {Pointer<IVdsAsync>} ppAsync 
     * @returns {HRESULT} 
     */
    Shrink(ullDesiredNumberOfReclaimableBytes, ullMinNumberOfReclaimableBytes, ppAsync) {
        result := ComCall(4, this, "uint", ullDesiredNumberOfReclaimableBytes, "uint", ullMinNumberOfReclaimableBytes, "ptr", ppAsync, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
