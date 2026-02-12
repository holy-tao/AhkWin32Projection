#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\DirectX\Direct3D11\IDirect3DSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * A nano-COM interface that allows COM interop with the [HolographicQuadLayerUpdateParameters](/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters) class for applications that use Direct3D 12 for holographic rendering.
 * @remarks
 * To use this interface in [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/), retrieve the [HolographicQuadLayerUpdateParameters](/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters) object from the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe), and then QueryInterface for the **IHolographicQuadLayerUpdateParametersInterop** interface.
 * 
 * ```cppwinrt
 * auto quadLayerParameters{ holographicFrame.GetQuadLayerUpdateParameters(m_quadLayer) };
 * winrt::com_ptr<IHolographicQuadLayerUpdateParametersInterop> quadLayerParametersInterop{
 *     quadLayerParameters.as<IHolographicQuadLayerUpdateParametersInterop>() };
 * ```
 * 
 * To use this interface in C++/CX, first cast the [HolographicQuadLayerUpdateParameters](/uwp/api/windows.graphics.holographic.holographicquadlayerupdateparameters) object (after retrieving it from the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe)) to [IInspectable](../inspectable/nn-inspectable-iinspectable.md)\*. Then QueryInterface for the **IHolographicQuadLayerUpdateParametersInterop** interface from the **IInspectable** pointer.
 * 
 * ```cppcx
 * auto quadLayerParameters = holographicFrame->GetQuadLayerUpdateParameters(m_quadLayer);
 * Microsoft::WRL::ComPtr<IHolographicQuadLayerUpdateParametersInterop> quadLayerParametersInterop;
 * {
 *     Microsoft::WRL::ComPtr<IInspectable> iInspectable = reinterpret_cast<IInspectable*>(quadLayerParameters);
 *     DX::ThrowIfFailed(iInspectable.As(&quadLayerParamsInterop));
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nn-windows-graphics-holographic-interop-iholographicquadlayerupdateparametersinterop
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicQuadLayerUpdateParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicQuadLayerUpdateParameters
     * @type {Guid}
     */
    static IID => Guid("{2b0ea3b0-798d-5bca-55c2-2c0c762ebb08}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireBufferToUpdateContent", "UpdateViewport", "UpdateContentProtectionEnabled", "UpdateExtents", "UpdateLocationWithStationaryMode", "UpdateLocationWithDisplayRelativeMode"]

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    AcquireBufferToUpdateContent() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DSurface(value)
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    UpdateViewport(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    UpdateContentProtectionEnabled(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Vector2} value 
     * @returns {HRESULT} 
     */
    UpdateExtents(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} position 
     * @param {Quaternion} orientation_ 
     * @returns {HRESULT} 
     */
    UpdateLocationWithStationaryMode(coordinateSystem, position, orientation_) {
        result := ComCall(10, this, "ptr", coordinateSystem, "ptr", position, "ptr", orientation_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Vector3} position 
     * @param {Quaternion} orientation_ 
     * @returns {HRESULT} 
     */
    UpdateLocationWithDisplayRelativeMode(position, orientation_) {
        result := ComCall(11, this, "ptr", position, "ptr", orientation_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
