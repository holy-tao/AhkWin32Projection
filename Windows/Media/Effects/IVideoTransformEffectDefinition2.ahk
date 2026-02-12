#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VideoTransformSphericalProjection.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Effects
 * @version WindowsRuntime 1.4
 */
class IVideoTransformEffectDefinition2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVideoTransformEffectDefinition2
     * @type {Guid}
     */
    static IID => Guid("{f0a8089f-66c8-4694-9fd9-1136abf7444a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SphericalProjection"]

    /**
     * @type {VideoTransformSphericalProjection} 
     */
    SphericalProjection {
        get => this.get_SphericalProjection()
    }

    /**
     * 
     * @returns {VideoTransformSphericalProjection} 
     */
    get_SphericalProjection() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VideoTransformSphericalProjection(value)
    }
}
