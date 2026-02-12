#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class ISystemPhotoProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISystemPhotoProperties
     * @type {Guid}
     */
    static IID => Guid("{4734fc3d-ab21-4424-b735-f4353a56c8fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CameraManufacturer", "get_CameraModel", "get_DateTaken", "get_Orientation", "get_PeopleNames"]

    /**
     * @type {HSTRING} 
     */
    CameraManufacturer {
        get => this.get_CameraManufacturer()
    }

    /**
     * @type {HSTRING} 
     */
    CameraModel {
        get => this.get_CameraModel()
    }

    /**
     * @type {HSTRING} 
     */
    DateTaken {
        get => this.get_DateTaken()
    }

    /**
     * @type {HSTRING} 
     */
    Orientation {
        get => this.get_Orientation()
    }

    /**
     * @type {HSTRING} 
     */
    PeopleNames {
        get => this.get_PeopleNames()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CameraManufacturer() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CameraModel() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DateTaken() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Orientation() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PeopleNames() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
