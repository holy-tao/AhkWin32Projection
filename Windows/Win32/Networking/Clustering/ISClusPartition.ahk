#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class ISClusPartition extends IDispatch{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Flags", "get_DeviceName", "get_VolumeLabel", "get_SerialNumber", "get_MaximumComponentLength", "get_FileSystemFlags", "get_FileSystem"]

    /**
     * 
     * @param {Pointer<Integer>} plFlags 
     * @returns {HRESULT} 
     */
    get_Flags(plFlags) {
        plFlagsMarshal := plFlags is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plFlagsMarshal, plFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDeviceName 
     * @returns {HRESULT} 
     */
    get_DeviceName(pbstrDeviceName) {
        result := ComCall(8, this, "ptr", pbstrDeviceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrVolumeLabel 
     * @returns {HRESULT} 
     */
    get_VolumeLabel(pbstrVolumeLabel) {
        result := ComCall(9, this, "ptr", pbstrVolumeLabel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plSerialNumber 
     * @returns {HRESULT} 
     */
    get_SerialNumber(plSerialNumber) {
        plSerialNumberMarshal := plSerialNumber is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plSerialNumberMarshal, plSerialNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plMaximumComponentLength 
     * @returns {HRESULT} 
     */
    get_MaximumComponentLength(plMaximumComponentLength) {
        plMaximumComponentLengthMarshal := plMaximumComponentLength is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, plMaximumComponentLengthMarshal, plMaximumComponentLength, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plFileSystemFlags 
     * @returns {HRESULT} 
     */
    get_FileSystemFlags(plFileSystemFlags) {
        plFileSystemFlagsMarshal := plFileSystemFlags is VarRef ? "int*" : "ptr"

        result := ComCall(12, this, plFileSystemFlagsMarshal, plFileSystemFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrFileSystem 
     * @returns {HRESULT} 
     */
    get_FileSystem(pbstrFileSystem) {
        result := ComCall(13, this, "ptr", pbstrFileSystem, "HRESULT")
        return result
    }
}
