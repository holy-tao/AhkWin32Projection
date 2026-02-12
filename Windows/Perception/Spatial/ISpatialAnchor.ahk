#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\SpatialCoordinateSystem.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial
 * @version WindowsRuntime 1.4
 */
class ISpatialAnchor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialAnchor
     * @type {Guid}
     */
    static IID => Guid("{0529e5ce-1d34-3702-bcec-eabff578a869}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CoordinateSystem", "get_RawCoordinateSystem", "add_RawCoordinateSystemAdjusted", "remove_RawCoordinateSystemAdjusted"]

    /**
     * @type {SpatialCoordinateSystem} 
     */
    CoordinateSystem {
        get => this.get_CoordinateSystem()
    }

    /**
     * @type {SpatialCoordinateSystem} 
     */
    RawCoordinateSystem {
        get => this.get_RawCoordinateSystem()
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_CoordinateSystem() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(value)
    }

    /**
     * 
     * @returns {SpatialCoordinateSystem} 
     */
    get_RawCoordinateSystem() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SpatialCoordinateSystem(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SpatialAnchor, SpatialAnchorRawCoordinateSystemAdjustedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RawCoordinateSystemAdjusted(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_RawCoordinateSystemAdjusted(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(9, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
