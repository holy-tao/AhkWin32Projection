#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception.Spatial.Surfaces
 * @version WindowsRuntime 1.4
 */
class ISpatialSurfaceObserverStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpatialSurfaceObserverStatics2
     * @type {Guid}
     */
    static IID => Guid("{0f534261-c55d-4e6b-a895-a19de69a42e3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSupported"]

    /**
     * 
     * @returns {Boolean} 
     */
    IsSupported() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
