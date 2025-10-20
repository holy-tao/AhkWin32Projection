#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\..\Guid.ahk
#Include ..\..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Graphics.Direct2D
 * @version v4.0.30319
 */
class IGeometrySource2DInterop extends IUnknown{
    /**
     * The interface identifier for IGeometrySource2DInterop
     * @type {Guid}
     */
    static IID => Guid("{0657af73-53fd-47cf-84ff-c8492d2a80a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ID2D1Geometry>} value 
     * @returns {HRESULT} 
     */
    GetGeometry(value) {
        result := ComCall(3, this, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ID2D1Factory>} factory 
     * @param {Pointer<ID2D1Geometry>} value 
     * @returns {HRESULT} 
     */
    TryGetGeometryUsingFactory(factory, value) {
        result := ComCall(4, this, "ptr", factory, "ptr", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
