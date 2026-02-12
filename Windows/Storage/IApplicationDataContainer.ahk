#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Foundation\Collections\IPropertySet.ahk
#Include ..\Foundation\Collections\IMapView.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include .\ApplicationDataContainer.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Storage
 * @version WindowsRuntime 1.4
 */
class IApplicationDataContainer extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IApplicationDataContainer
     * @type {Guid}
     */
    static IID => Guid("{c5aefd1e-f467-40ba-8566-ab640a441e1d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_Locality", "get_Values", "get_Containers", "CreateContainer", "DeleteContainer"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    Locality {
        get => this.get_Locality()
    }

    /**
     * @type {IPropertySet} 
     */
    Values {
        get => this.get_Values()
    }

    /**
     * @type {IMapView<HSTRING, ApplicationDataContainer>} 
     */
    Containers {
        get => this.get_Containers()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Locality() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IPropertySet} 
     */
    get_Values() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IPropertySet(value)
    }

    /**
     * 
     * @returns {IMapView<HSTRING, ApplicationDataContainer>} 
     */
    get_Containers() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => HSTRING({ Value: ptr }), ApplicationDataContainer, value)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @param {Integer} disposition 
     * @returns {ApplicationDataContainer} 
     */
    CreateContainer(name, disposition) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(10, this, "ptr", name, "int", disposition, "ptr*", &container := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ApplicationDataContainer(container)
    }

    /**
     * 
     * @param {HSTRING} name 
     * @returns {HRESULT} 
     */
    DeleteContainer(name) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name

        result := ComCall(11, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
