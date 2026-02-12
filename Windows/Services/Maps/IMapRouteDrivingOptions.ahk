#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class IMapRouteDrivingOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapRouteDrivingOptions
     * @type {Guid}
     */
    static IID => Guid("{6815364d-c6dc-4697-a452-b18f8f0b67a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MaxAlternateRouteCount", "put_MaxAlternateRouteCount", "get_InitialHeading", "put_InitialHeading", "get_RouteOptimization", "put_RouteOptimization", "get_RouteRestrictions", "put_RouteRestrictions"]

    /**
     * @type {Integer} 
     */
    MaxAlternateRouteCount {
        get => this.get_MaxAlternateRouteCount()
        set => this.put_MaxAlternateRouteCount(value)
    }

    /**
     * @type {IReference<Float>} 
     */
    InitialHeading {
        get => this.get_InitialHeading()
        set => this.put_InitialHeading(value)
    }

    /**
     * @type {Integer} 
     */
    RouteOptimization {
        get => this.get_RouteOptimization()
        set => this.put_RouteOptimization(value)
    }

    /**
     * @type {Integer} 
     */
    RouteRestrictions {
        get => this.get_RouteRestrictions()
        set => this.put_RouteRestrictions(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxAlternateRouteCount() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxAlternateRouteCount(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_InitialHeading() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDouble(), value)
    }

    /**
     * 
     * @param {IReference<Float>} value 
     * @returns {HRESULT} 
     */
    put_InitialHeading(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RouteOptimization() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RouteOptimization(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RouteRestrictions() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_RouteRestrictions(value) {
        result := ComCall(13, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
