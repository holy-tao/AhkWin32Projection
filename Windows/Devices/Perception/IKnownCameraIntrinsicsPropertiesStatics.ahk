#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class IKnownCameraIntrinsicsPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownCameraIntrinsicsPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{08c03978-437a-4d97-a663-fd3195600249}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FocalLength", "get_PrincipalPoint", "get_RadialDistortion", "get_TangentialDistortion"]

    /**
     * @type {HSTRING} 
     */
    FocalLength {
        get => this.get_FocalLength()
    }

    /**
     * @type {HSTRING} 
     */
    PrincipalPoint {
        get => this.get_PrincipalPoint()
    }

    /**
     * @type {HSTRING} 
     */
    RadialDistortion {
        get => this.get_RadialDistortion()
    }

    /**
     * @type {HSTRING} 
     */
    TangentialDistortion {
        get => this.get_TangentialDistortion()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FocalLength() {
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
    get_PrincipalPoint() {
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
    get_RadialDistortion() {
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
    get_TangentialDistortion() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
