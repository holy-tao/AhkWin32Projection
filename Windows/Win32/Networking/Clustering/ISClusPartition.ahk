#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {Integer} 
     */
    Flags {
        get => this.get_Flags()
    }

    /**
     * @type {BSTR} 
     */
    DeviceName {
        get => this.get_DeviceName()
    }

    /**
     * @type {BSTR} 
     */
    VolumeLabel {
        get => this.get_VolumeLabel()
    }

    /**
     * @type {Integer} 
     */
    SerialNumber {
        get => this.get_SerialNumber()
    }

    /**
     * @type {Integer} 
     */
    MaximumComponentLength {
        get => this.get_MaximumComponentLength()
    }

    /**
     * @type {Integer} 
     */
    FileSystemFlags {
        get => this.get_FileSystemFlags()
    }

    /**
     * @type {BSTR} 
     */
    FileSystem {
        get => this.get_FileSystem()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Flags() {
        result := ComCall(7, this, "int*", &plFlags := 0, "HRESULT")
        return plFlags
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DeviceName() {
        pbstrDeviceName := BSTR()
        result := ComCall(8, this, "ptr", pbstrDeviceName, "HRESULT")
        return pbstrDeviceName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_VolumeLabel() {
        pbstrVolumeLabel := BSTR()
        result := ComCall(9, this, "ptr", pbstrVolumeLabel, "HRESULT")
        return pbstrVolumeLabel
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SerialNumber() {
        result := ComCall(10, this, "int*", &plSerialNumber := 0, "HRESULT")
        return plSerialNumber
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaximumComponentLength() {
        result := ComCall(11, this, "int*", &plMaximumComponentLength := 0, "HRESULT")
        return plMaximumComponentLength
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FileSystemFlags() {
        result := ComCall(12, this, "int*", &plFileSystemFlags := 0, "HRESULT")
        return plFileSystemFlags
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_FileSystem() {
        pbstrFileSystem := BSTR()
        result := ComCall(13, this, "ptr", pbstrFileSystem, "HRESULT")
        return pbstrFileSystem
    }
}
