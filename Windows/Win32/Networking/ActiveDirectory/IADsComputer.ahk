#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsComputer interface is a dual interface that inherits from IADs.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadscomputer
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsComputer extends IADs{
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
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ComputerID(retval) {
        result := ComCall(20, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Site(retval) {
        result := ComCall(21, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Description(retval) {
        result := ComCall(22, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(23, this, "ptr", bstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Location(retval) {
        result := ComCall(24, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrLocation 
     * @returns {HRESULT} 
     */
    put_Location(bstrLocation) {
        bstrLocation := bstrLocation is String ? BSTR.Alloc(bstrLocation).Value : bstrLocation

        result := ComCall(25, this, "ptr", bstrLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_PrimaryUser(retval) {
        result := ComCall(26, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPrimaryUser 
     * @returns {HRESULT} 
     */
    put_PrimaryUser(bstrPrimaryUser) {
        bstrPrimaryUser := bstrPrimaryUser is String ? BSTR.Alloc(bstrPrimaryUser).Value : bstrPrimaryUser

        result := ComCall(27, this, "ptr", bstrPrimaryUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Owner(retval) {
        result := ComCall(28, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOwner 
     * @returns {HRESULT} 
     */
    put_Owner(bstrOwner) {
        bstrOwner := bstrOwner is String ? BSTR.Alloc(bstrOwner).Value : bstrOwner

        result := ComCall(29, this, "ptr", bstrOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Division(retval) {
        result := ComCall(30, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDivision 
     * @returns {HRESULT} 
     */
    put_Division(bstrDivision) {
        bstrDivision := bstrDivision is String ? BSTR.Alloc(bstrDivision).Value : bstrDivision

        result := ComCall(31, this, "ptr", bstrDivision, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Department(retval) {
        result := ComCall(32, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDepartment 
     * @returns {HRESULT} 
     */
    put_Department(bstrDepartment) {
        bstrDepartment := bstrDepartment is String ? BSTR.Alloc(bstrDepartment).Value : bstrDepartment

        result := ComCall(33, this, "ptr", bstrDepartment, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Role(retval) {
        result := ComCall(34, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrRole 
     * @returns {HRESULT} 
     */
    put_Role(bstrRole) {
        bstrRole := bstrRole is String ? BSTR.Alloc(bstrRole).Value : bstrRole

        result := ComCall(35, this, "ptr", bstrRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_OperatingSystem(retval) {
        result := ComCall(36, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOperatingSystem 
     * @returns {HRESULT} 
     */
    put_OperatingSystem(bstrOperatingSystem) {
        bstrOperatingSystem := bstrOperatingSystem is String ? BSTR.Alloc(bstrOperatingSystem).Value : bstrOperatingSystem

        result := ComCall(37, this, "ptr", bstrOperatingSystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_OperatingSystemVersion(retval) {
        result := ComCall(38, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOperatingSystemVersion 
     * @returns {HRESULT} 
     */
    put_OperatingSystemVersion(bstrOperatingSystemVersion) {
        bstrOperatingSystemVersion := bstrOperatingSystemVersion is String ? BSTR.Alloc(bstrOperatingSystemVersion).Value : bstrOperatingSystemVersion

        result := ComCall(39, this, "ptr", bstrOperatingSystemVersion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Model(retval) {
        result := ComCall(40, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrModel 
     * @returns {HRESULT} 
     */
    put_Model(bstrModel) {
        bstrModel := bstrModel is String ? BSTR.Alloc(bstrModel).Value : bstrModel

        result := ComCall(41, this, "ptr", bstrModel, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_Processor(retval) {
        result := ComCall(42, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProcessor 
     * @returns {HRESULT} 
     */
    put_Processor(bstrProcessor) {
        bstrProcessor := bstrProcessor is String ? BSTR.Alloc(bstrProcessor).Value : bstrProcessor

        result := ComCall(43, this, "ptr", bstrProcessor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_ProcessorCount(retval) {
        result := ComCall(44, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProcessorCount 
     * @returns {HRESULT} 
     */
    put_ProcessorCount(bstrProcessorCount) {
        bstrProcessorCount := bstrProcessorCount is String ? BSTR.Alloc(bstrProcessorCount).Value : bstrProcessorCount

        result := ComCall(45, this, "ptr", bstrProcessorCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_MemorySize(retval) {
        result := ComCall(46, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMemorySize 
     * @returns {HRESULT} 
     */
    put_MemorySize(bstrMemorySize) {
        bstrMemorySize := bstrMemorySize is String ? BSTR.Alloc(bstrMemorySize).Value : bstrMemorySize

        result := ComCall(47, this, "ptr", bstrMemorySize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} retval 
     * @returns {HRESULT} 
     */
    get_StorageCapacity(retval) {
        result := ComCall(48, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrStorageCapacity 
     * @returns {HRESULT} 
     */
    put_StorageCapacity(bstrStorageCapacity) {
        bstrStorageCapacity := bstrStorageCapacity is String ? BSTR.Alloc(bstrStorageCapacity).Value : bstrStorageCapacity

        result := ComCall(49, this, "ptr", bstrStorageCapacity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} retval 
     * @returns {HRESULT} 
     */
    get_NetAddresses(retval) {
        result := ComCall(50, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT} vNetAddresses 
     * @returns {HRESULT} 
     */
    put_NetAddresses(vNetAddresses) {
        result := ComCall(51, this, "ptr", vNetAddresses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
