#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IADs.ahk" { IADs }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IADsComputer interface is a dual interface that inherits from IADs.
 * @see https://learn.microsoft.com/windows/win32/api/iads/nn-iads-iadscomputer
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct IADsComputer extends IADs {
    /**
     * The interface identifier for IADsComputer
     * @type {Guid}
     */
    static IID := Guid("{efe3cc70-1d9f-11cf-b1f3-02608c9e7553}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IADsComputer interfaces
    */
    struct Vtbl extends IADs.Vtbl {
        get_ComputerID             : IntPtr
        get_Site                   : IntPtr
        get_Description            : IntPtr
        put_Description            : IntPtr
        get_Location               : IntPtr
        put_Location               : IntPtr
        get_PrimaryUser            : IntPtr
        put_PrimaryUser            : IntPtr
        get_Owner                  : IntPtr
        put_Owner                  : IntPtr
        get_Division               : IntPtr
        put_Division               : IntPtr
        get_Department             : IntPtr
        put_Department             : IntPtr
        get_Role                   : IntPtr
        put_Role                   : IntPtr
        get_OperatingSystem        : IntPtr
        put_OperatingSystem        : IntPtr
        get_OperatingSystemVersion : IntPtr
        put_OperatingSystemVersion : IntPtr
        get_Model                  : IntPtr
        put_Model                  : IntPtr
        get_Processor              : IntPtr
        put_Processor              : IntPtr
        get_ProcessorCount         : IntPtr
        put_ProcessorCount         : IntPtr
        get_MemorySize             : IntPtr
        put_MemorySize             : IntPtr
        get_StorageCapacity        : IntPtr
        put_StorageCapacity        : IntPtr
        get_NetAddresses           : IntPtr
        put_NetAddresses           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IADsComputer.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        retval := BSTR.Owned()
        result := ComCall(20, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Site() {
        retval := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        retval := BSTR.Owned()
        result := ComCall(22, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(23, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Location() {
        retval := BSTR.Owned()
        result := ComCall(24, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrLocation 
     * @returns {HRESULT} 
     */
    put_Location(bstrLocation) {
        bstrLocation := bstrLocation is String ? BSTR.Alloc(bstrLocation).Value : bstrLocation

        result := ComCall(25, this, BSTR, bstrLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PrimaryUser() {
        retval := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrPrimaryUser 
     * @returns {HRESULT} 
     */
    put_PrimaryUser(bstrPrimaryUser) {
        bstrPrimaryUser := bstrPrimaryUser is String ? BSTR.Alloc(bstrPrimaryUser).Value : bstrPrimaryUser

        result := ComCall(27, this, BSTR, bstrPrimaryUser, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Owner() {
        retval := BSTR.Owned()
        result := ComCall(28, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOwner 
     * @returns {HRESULT} 
     */
    put_Owner(bstrOwner) {
        bstrOwner := bstrOwner is String ? BSTR.Alloc(bstrOwner).Value : bstrOwner

        result := ComCall(29, this, BSTR, bstrOwner, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Division() {
        retval := BSTR.Owned()
        result := ComCall(30, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDivision 
     * @returns {HRESULT} 
     */
    put_Division(bstrDivision) {
        bstrDivision := bstrDivision is String ? BSTR.Alloc(bstrDivision).Value : bstrDivision

        result := ComCall(31, this, BSTR, bstrDivision, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Department() {
        retval := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrDepartment 
     * @returns {HRESULT} 
     */
    put_Department(bstrDepartment) {
        bstrDepartment := bstrDepartment is String ? BSTR.Alloc(bstrDepartment).Value : bstrDepartment

        result := ComCall(33, this, BSTR, bstrDepartment, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Role() {
        retval := BSTR.Owned()
        result := ComCall(34, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrRole 
     * @returns {HRESULT} 
     */
    put_Role(bstrRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(35, this, BSTR, bstrRole, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_OperatingSystem() {
        retval := BSTR.Owned()
        result := ComCall(36, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOperatingSystem 
     * @returns {HRESULT} 
     */
    put_OperatingSystem(bstrOperatingSystem) {
        bstrOperatingSystem := bstrOperatingSystem is String ? BSTR.Alloc(bstrOperatingSystem).Value : bstrOperatingSystem

        result := ComCall(37, this, BSTR, bstrOperatingSystem, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_OperatingSystemVersion() {
        retval := BSTR.Owned()
        result := ComCall(38, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrOperatingSystemVersion 
     * @returns {HRESULT} 
     */
    put_OperatingSystemVersion(bstrOperatingSystemVersion) {
        bstrOperatingSystemVersion := bstrOperatingSystemVersion is String ? BSTR.Alloc(bstrOperatingSystemVersion).Value : bstrOperatingSystemVersion

        result := ComCall(39, this, BSTR, bstrOperatingSystemVersion, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Model() {
        retval := BSTR.Owned()
        result := ComCall(40, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrModel 
     * @returns {HRESULT} 
     */
    put_Model(bstrModel) {
        bstrModel := bstrModel is String ? BSTR.Alloc(bstrModel).Value : bstrModel

        result := ComCall(41, this, BSTR, bstrModel, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Processor() {
        retval := BSTR.Owned()
        result := ComCall(42, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrProcessor 
     * @returns {HRESULT} 
     */
    put_Processor(bstrProcessor) {
        bstrProcessor := bstrProcessor is String ? BSTR.Alloc(bstrProcessor).Value : bstrProcessor

        result := ComCall(43, this, BSTR, bstrProcessor, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ProcessorCount() {
        retval := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrProcessorCount 
     * @returns {HRESULT} 
     */
    put_ProcessorCount(bstrProcessorCount) {
        bstrProcessorCount := bstrProcessorCount is String ? BSTR.Alloc(bstrProcessorCount).Value : bstrProcessorCount

        result := ComCall(45, this, BSTR, bstrProcessorCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_MemorySize() {
        retval := BSTR.Owned()
        result := ComCall(46, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrMemorySize 
     * @returns {HRESULT} 
     */
    put_MemorySize(bstrMemorySize) {
        bstrMemorySize := bstrMemorySize is String ? BSTR.Alloc(bstrMemorySize).Value : bstrMemorySize

        result := ComCall(47, this, BSTR, bstrMemorySize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_StorageCapacity() {
        retval := BSTR.Owned()
        result := ComCall(48, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {BSTR} bstrStorageCapacity 
     * @returns {HRESULT} 
     */
    put_StorageCapacity(bstrStorageCapacity) {
        bstrStorageCapacity := bstrStorageCapacity is String ? BSTR.Alloc(bstrStorageCapacity).Value : bstrStorageCapacity

        result := ComCall(49, this, BSTR, bstrStorageCapacity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT} 
     */
    get_NetAddresses() {
        retval := VARIANT()
        result := ComCall(50, this, VARIANT.Ptr, retval, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT} vNetAddresses 
     * @returns {HRESULT} 
     */
    put_NetAddresses(vNetAddresses) {
        result := ComCall(51, this, VARIANT, vNetAddresses, "HRESULT")
        return result
    }

    Query(iid) {
        if (IADsComputer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ComputerID := CallbackCreate(GetMethod(implObj, "get_ComputerID"), flags, 2)
        this.vtbl.get_Site := CallbackCreate(GetMethod(implObj, "get_Site"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_Location := CallbackCreate(GetMethod(implObj, "get_Location"), flags, 2)
        this.vtbl.put_Location := CallbackCreate(GetMethod(implObj, "put_Location"), flags, 2)
        this.vtbl.get_PrimaryUser := CallbackCreate(GetMethod(implObj, "get_PrimaryUser"), flags, 2)
        this.vtbl.put_PrimaryUser := CallbackCreate(GetMethod(implObj, "put_PrimaryUser"), flags, 2)
        this.vtbl.get_Owner := CallbackCreate(GetMethod(implObj, "get_Owner"), flags, 2)
        this.vtbl.put_Owner := CallbackCreate(GetMethod(implObj, "put_Owner"), flags, 2)
        this.vtbl.get_Division := CallbackCreate(GetMethod(implObj, "get_Division"), flags, 2)
        this.vtbl.put_Division := CallbackCreate(GetMethod(implObj, "put_Division"), flags, 2)
        this.vtbl.get_Department := CallbackCreate(GetMethod(implObj, "get_Department"), flags, 2)
        this.vtbl.put_Department := CallbackCreate(GetMethod(implObj, "put_Department"), flags, 2)
        this.vtbl.get_Role := CallbackCreate(GetMethod(implObj, "get_Role"), flags, 2)
        this.vtbl.put_Role := CallbackCreate(GetMethod(implObj, "put_Role"), flags, 2)
        this.vtbl.get_OperatingSystem := CallbackCreate(GetMethod(implObj, "get_OperatingSystem"), flags, 2)
        this.vtbl.put_OperatingSystem := CallbackCreate(GetMethod(implObj, "put_OperatingSystem"), flags, 2)
        this.vtbl.get_OperatingSystemVersion := CallbackCreate(GetMethod(implObj, "get_OperatingSystemVersion"), flags, 2)
        this.vtbl.put_OperatingSystemVersion := CallbackCreate(GetMethod(implObj, "put_OperatingSystemVersion"), flags, 2)
        this.vtbl.get_Model := CallbackCreate(GetMethod(implObj, "get_Model"), flags, 2)
        this.vtbl.put_Model := CallbackCreate(GetMethod(implObj, "put_Model"), flags, 2)
        this.vtbl.get_Processor := CallbackCreate(GetMethod(implObj, "get_Processor"), flags, 2)
        this.vtbl.put_Processor := CallbackCreate(GetMethod(implObj, "put_Processor"), flags, 2)
        this.vtbl.get_ProcessorCount := CallbackCreate(GetMethod(implObj, "get_ProcessorCount"), flags, 2)
        this.vtbl.put_ProcessorCount := CallbackCreate(GetMethod(implObj, "put_ProcessorCount"), flags, 2)
        this.vtbl.get_MemorySize := CallbackCreate(GetMethod(implObj, "get_MemorySize"), flags, 2)
        this.vtbl.put_MemorySize := CallbackCreate(GetMethod(implObj, "put_MemorySize"), flags, 2)
        this.vtbl.get_StorageCapacity := CallbackCreate(GetMethod(implObj, "get_StorageCapacity"), flags, 2)
        this.vtbl.put_StorageCapacity := CallbackCreate(GetMethod(implObj, "put_StorageCapacity"), flags, 2)
        this.vtbl.get_NetAddresses := CallbackCreate(GetMethod(implObj, "get_NetAddresses"), flags, 2)
        this.vtbl.put_NetAddresses := CallbackCreate(GetMethod(implObj, "put_NetAddresses"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ComputerID)
        CallbackFree(this.vtbl.get_Site)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_Location)
        CallbackFree(this.vtbl.put_Location)
        CallbackFree(this.vtbl.get_PrimaryUser)
        CallbackFree(this.vtbl.put_PrimaryUser)
        CallbackFree(this.vtbl.get_Owner)
        CallbackFree(this.vtbl.put_Owner)
        CallbackFree(this.vtbl.get_Division)
        CallbackFree(this.vtbl.put_Division)
        CallbackFree(this.vtbl.get_Department)
        CallbackFree(this.vtbl.put_Department)
        CallbackFree(this.vtbl.get_Role)
        CallbackFree(this.vtbl.put_Role)
        CallbackFree(this.vtbl.get_OperatingSystem)
        CallbackFree(this.vtbl.put_OperatingSystem)
        CallbackFree(this.vtbl.get_OperatingSystemVersion)
        CallbackFree(this.vtbl.put_OperatingSystemVersion)
        CallbackFree(this.vtbl.get_Model)
        CallbackFree(this.vtbl.put_Model)
        CallbackFree(this.vtbl.get_Processor)
        CallbackFree(this.vtbl.put_Processor)
        CallbackFree(this.vtbl.get_ProcessorCount)
        CallbackFree(this.vtbl.put_ProcessorCount)
        CallbackFree(this.vtbl.get_MemorySize)
        CallbackFree(this.vtbl.put_MemorySize)
        CallbackFree(this.vtbl.get_StorageCapacity)
        CallbackFree(this.vtbl.put_StorageCapacity)
        CallbackFree(this.vtbl.get_NetAddresses)
        CallbackFree(this.vtbl.put_NetAddresses)
    }
}
