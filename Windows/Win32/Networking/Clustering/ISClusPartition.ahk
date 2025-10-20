#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusPartition extends IDispatch{
    /**
     * The interface identifier for ISClusPartition
     * @type {Guid}
     */
    static IID => Guid("{f2e60720-2631-11d1-89f1-00a0c90d061e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} plFlags 
     * @returns {HRESULT} 
     */
    get_Flags(plFlags) {
        result := ComCall(7, this, "int*", plFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceName 
     * @returns {HRESULT} 
     */
    get_DeviceName(pbstrDeviceName) {
        result := ComCall(8, this, "ptr", pbstrDeviceName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVolumeLabel 
     * @returns {HRESULT} 
     */
    get_VolumeLabel(pbstrVolumeLabel) {
        result := ComCall(9, this, "ptr", pbstrVolumeLabel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plSerialNumber 
     * @returns {HRESULT} 
     */
    get_SerialNumber(plSerialNumber) {
        result := ComCall(10, this, "int*", plSerialNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plMaximumComponentLength 
     * @returns {HRESULT} 
     */
    get_MaximumComponentLength(plMaximumComponentLength) {
        result := ComCall(11, this, "int*", plMaximumComponentLength, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plFileSystemFlags 
     * @returns {HRESULT} 
     */
    get_FileSystemFlags(plFileSystemFlags) {
        result := ComCall(12, this, "int*", plFileSystemFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFileSystem 
     * @returns {HRESULT} 
     */
    get_FileSystem(pbstrFileSystem) {
        result := ComCall(13, this, "ptr", pbstrFileSystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
