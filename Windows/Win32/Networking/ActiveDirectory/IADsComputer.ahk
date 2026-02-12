#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\IADs.ahk

/**
 * The IADsComputer interface is a dual interface that inherits from IADs.
 * @see https://learn.microsoft.com/windows/win32/api//content/iads/nn-iads-iadscomputer
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsComputer extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsComputer
     * @type {Guid}
     */
    static IID => Guid("{efe3cc70-1d9f-11cf-b1f3-02608c9e7553}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ComputerID", "get_Site", "get_Description", "put_Description", "get_Location", "put_Location", "get_PrimaryUser", "put_PrimaryUser", "get_Owner", "put_Owner", "get_Division", "put_Division", "get_Department", "put_Department", "get_Role", "put_Role", "get_OperatingSystem", "put_OperatingSystem", "get_OperatingSystemVersion", "put_OperatingSystemVersion", "get_Model", "put_Model", "get_Processor", "put_Processor", "get_ProcessorCount", "put_ProcessorCount", "get_MemorySize", "put_MemorySize", "get_StorageCapacity", "put_StorageCapacity", "get_NetAddresses", "put_NetAddresses"]

    /**
     * @type {BSTR} 
     */
    ComputerID {
        get => this.get_ComputerID()
    }

    /**
     * @type {BSTR} 
     */
    Site {
        get => this.get_Site()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    Location {
        get => this.get_Location()
        set => this.put_Location(value)
    }

    /**
     * @type {BSTR} 
     */
    PrimaryUser {
        get => this.get_PrimaryUser()
        set => this.put_PrimaryUser(value)
    }

    /**
     * @type {BSTR} 
     */
    Owner {
        get => this.get_Owner()
        set => this.put_Owner(value)
    }

    /**
     * @type {BSTR} 
     */
    Division {
        get => this.get_Division()
        set => this.put_Division(value)
    }

    /**
     * @type {BSTR} 
     */
    Department {
        get => this.get_Department()
        set => this.put_Department(value)
    }

    /**
     * @type {BSTR} 
     */
    Role {
        get => this.get_Role()
        set => this.put_Role(value)
    }

    /**
     * @type {BSTR} 
     */
    OperatingSystem {
        get => this.get_OperatingSystem()
        set => this.put_OperatingSystem(value)
    }

    /**
     * @type {BSTR} 
     */
    OperatingSystemVersion {
        get => this.get_OperatingSystemVersion()
        set => this.put_OperatingSystemVersion(value)
    }

    /**
     * @type {BSTR} 
     */
    Model {
        get => this.get_Model()
        set => this.put_Model(value)
    }

    /**
     * @type {BSTR} 
     */
    Processor {
        get => this.get_Processor()
        set => this.put_Processor(value)
    }

    /**
     * @type {BSTR} 
     */
    ProcessorCount {
        get => this.get_ProcessorCount()
        set => this.put_ProcessorCount(value)
    }

    /**
     * @type {BSTR} 
     */
    MemorySize {
        get => this.get_MemorySize()
        set => this.put_MemorySize(value)
    }

    /**
     * @type {BSTR} 
     */
    StorageCapacity {
        get => this.get_StorageCapacity()
        set => this.put_StorageCapacity(value)
    }

    /**
     * @type {VARIANT} 
     */
    NetAddresses {
        get => this.get_NetAddresses()
        set => this.put_NetAddresses(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ComputerID() {
        retval := BSTR()
        result := ComCall(20, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Site() {
        retval := BSTR()
        result := ComCall(21, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR()
        result := ComCall(22, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        if(bstrDescription is String) {
            pin := BSTR.Alloc(bstrDescription)
            bstrDescription := pin.Value
        }

        result := ComCall(23, this, "ptr", bstrDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Location() {
        retval := BSTR()
        result := ComCall(24, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrLocation 
     * @returns {HRESULT} 
     */
    put_Location(bstrLocation) {
        if(bstrLocation is String) {
            pin := BSTR.Alloc(bstrLocation)
            bstrLocation := pin.Value
        }

        result := ComCall(25, this, "ptr", bstrLocation, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PrimaryUser() {
        retval := BSTR()
        result := ComCall(26, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPrimaryUser 
     * @returns {HRESULT} 
     */
    put_PrimaryUser(bstrPrimaryUser) {
        if(bstrPrimaryUser is String) {
            pin := BSTR.Alloc(bstrPrimaryUser)
            bstrPrimaryUser := pin.Value
        }

        result := ComCall(27, this, "ptr", bstrPrimaryUser, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Owner() {
        retval := BSTR()
        result := ComCall(28, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOwner 
     * @returns {HRESULT} 
     */
    put_Owner(bstrOwner) {
        if(bstrOwner is String) {
            pin := BSTR.Alloc(bstrOwner)
            bstrOwner := pin.Value
        }

        result := ComCall(29, this, "ptr", bstrOwner, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Division() {
        retval := BSTR()
        result := ComCall(30, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDivision 
     * @returns {HRESULT} 
     */
    put_Division(bstrDivision) {
        if(bstrDivision is String) {
            pin := BSTR.Alloc(bstrDivision)
            bstrDivision := pin.Value
        }

        result := ComCall(31, this, "ptr", bstrDivision, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Department() {
        retval := BSTR()
        result := ComCall(32, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDepartment 
     * @returns {HRESULT} 
     */
    put_Department(bstrDepartment) {
        if(bstrDepartment is String) {
            pin := BSTR.Alloc(bstrDepartment)
            bstrDepartment := pin.Value
        }

        result := ComCall(33, this, "ptr", bstrDepartment, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Role() {
        retval := BSTR()
        result := ComCall(34, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrRole 
     * @returns {HRESULT} 
     */
    put_Role(bstrRole) {
        if(bstrRole is String) {
            pin := BSTR.Alloc(bstrRole)
            bstrRole := pin.Value
        }

        result := ComCall(35, this, "ptr", bstrRole, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_OperatingSystem() {
        retval := BSTR()
        result := ComCall(36, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOperatingSystem 
     * @returns {HRESULT} 
     */
    put_OperatingSystem(bstrOperatingSystem) {
        if(bstrOperatingSystem is String) {
            pin := BSTR.Alloc(bstrOperatingSystem)
            bstrOperatingSystem := pin.Value
        }

        result := ComCall(37, this, "ptr", bstrOperatingSystem, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_OperatingSystemVersion() {
        retval := BSTR()
        result := ComCall(38, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOperatingSystemVersion 
     * @returns {HRESULT} 
     */
    put_OperatingSystemVersion(bstrOperatingSystemVersion) {
        if(bstrOperatingSystemVersion is String) {
            pin := BSTR.Alloc(bstrOperatingSystemVersion)
            bstrOperatingSystemVersion := pin.Value
        }

        result := ComCall(39, this, "ptr", bstrOperatingSystemVersion, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Model() {
        retval := BSTR()
        result := ComCall(40, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrModel 
     * @returns {HRESULT} 
     */
    put_Model(bstrModel) {
        if(bstrModel is String) {
            pin := BSTR.Alloc(bstrModel)
            bstrModel := pin.Value
        }

        result := ComCall(41, this, "ptr", bstrModel, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Processor() {
        retval := BSTR()
        result := ComCall(42, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrProcessor 
     * @returns {HRESULT} 
     */
    put_Processor(bstrProcessor) {
        if(bstrProcessor is String) {
            pin := BSTR.Alloc(bstrProcessor)
            bstrProcessor := pin.Value
        }

        result := ComCall(43, this, "ptr", bstrProcessor, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProcessorCount() {
        retval := BSTR()
        result := ComCall(44, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrProcessorCount 
     * @returns {HRESULT} 
     */
    put_ProcessorCount(bstrProcessorCount) {
        if(bstrProcessorCount is String) {
            pin := BSTR.Alloc(bstrProcessorCount)
            bstrProcessorCount := pin.Value
        }

        result := ComCall(45, this, "ptr", bstrProcessorCount, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_MemorySize() {
        retval := BSTR()
        result := ComCall(46, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrMemorySize 
     * @returns {HRESULT} 
     */
    put_MemorySize(bstrMemorySize) {
        if(bstrMemorySize is String) {
            pin := BSTR.Alloc(bstrMemorySize)
            bstrMemorySize := pin.Value
        }

        result := ComCall(47, this, "ptr", bstrMemorySize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StorageCapacity() {
        retval := BSTR()
        result := ComCall(48, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {BSTR} bstrStorageCapacity 
     * @returns {HRESULT} 
     */
    put_StorageCapacity(bstrStorageCapacity) {
        if(bstrStorageCapacity is String) {
            pin := BSTR.Alloc(bstrStorageCapacity)
            bstrStorageCapacity := pin.Value
        }

        result := ComCall(49, this, "ptr", bstrStorageCapacity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_NetAddresses() {
        retval := VARIANT()
        result := ComCall(50, this, "ptr", retval, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return retval
    }

    /**
     * 
     * @param {VARIANT} vNetAddresses 
     * @returns {HRESULT} 
     */
    put_NetAddresses(vNetAddresses) {
        result := ComCall(51, this, "ptr", vNetAddresses, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
