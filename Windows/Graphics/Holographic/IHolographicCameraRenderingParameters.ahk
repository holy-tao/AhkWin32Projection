#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\DirectX\Direct3D11\IDirect3DDevice.ahk
#Include ..\DirectX\Direct3D11\IDirect3DSurface.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * A nano-COM interface that allows COM interop with the [HolographicCameraRenderingParameters](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters) class for applications that use Direct3D 12 for holographic rendering.
 * @remarks
 * To use this interface in [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/), retrieve the [HolographicCameraRenderingParameters](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters) object from the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe), and then **QueryInterface** for the **IHolographicCameraRenderingParametersInterop** interface.
 * 
 * ```cppwinrt
 * auto holographicCameraRenderingParameters { holographicFrame.GetRenderingParameters(m_cameraPose) };
 * winrt::com_ptr<IHolographicCameraRenderingParametersInterop> holographicCameraRenderingParametersInterop
 * {
 *     holographicCameraRenderingParameters.as<IHolographicCameraRenderingParametersInterop>();
 * };
 * ```
 * 
 * To use this interface in C++/CX, first cast the [HolographicCameraRenderingParameters](/uwp/api/windows.graphics.holographic.holographiccamerarenderingparameters) object (after retrieving it from the [HolographicFrame](/uwp/api/windows.graphics.holographic.holographicframe)) to [IInspectable](../inspectable/nn-inspectable-iinspectable.md)\*. Then **QueryInterface** for the **IHolographicCameraRenderingParametersInterop** interface from the **IInspectable** pointer.
 * 
 * ```cppcx
 * auto holographicCameraRenderingParameters = 
 *     holographicFrame->GetRenderingParameters(m_cameraPose);
 * Microsoft::WRL::ComPtr<IHolographicCameraRenderingParametersInterop> 
 *     holographicCameraRenderingParametersInterop;
 * {
 *     Microsoft::WRL::ComPtr<IInspectable> iInspectable = reinterpret_cast<IInspectable*>(holographicCameraRenderingParameters);
 *     DX::ThrowIfFailed(iInspectable.As(&holographicCameraRenderingParametersInterop));
 * }
 * ```
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.graphics.holographic.interop/nn-windows-graphics-holographic-interop-iholographiccamerarenderingparametersinterop
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class IHolographicCameraRenderingParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHolographicCameraRenderingParameters
     * @type {Guid}
     */
    static IID => Guid("{8eac2ed1-5bf4-4e16-8236-ae0800c11d0d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFocusPoint", "SetFocusPointWithNormal", "SetFocusPointWithNormalLinearVelocity", "get_Direct3D11Device", "get_Direct3D11BackBuffer"]

    /**
     * @type {IDirect3DDevice} 
     */
    Direct3D11Device {
        get => this.get_Direct3D11Device()
    }

    /**
     * @type {IDirect3DSurface} 
     */
    Direct3D11BackBuffer {
        get => this.get_Direct3D11BackBuffer()
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} position 
     * @returns {HRESULT} 
     */
    SetFocusPoint(coordinateSystem, position) {
        result := ComCall(6, this, "ptr", coordinateSystem, "ptr", position, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} position 
     * @param {Vector3} normal 
     * @returns {HRESULT} 
     */
    SetFocusPointWithNormal(coordinateSystem, position, normal) {
        result := ComCall(7, this, "ptr", coordinateSystem, "ptr", position, "ptr", normal, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {SpatialCoordinateSystem} coordinateSystem 
     * @param {Vector3} position 
     * @param {Vector3} normal 
     * @param {Vector3} linearVelocity 
     * @returns {HRESULT} 
     */
    SetFocusPointWithNormalLinearVelocity(coordinateSystem, position, normal, linearVelocity) {
        result := ComCall(8, this, "ptr", coordinateSystem, "ptr", position, "ptr", normal, "ptr", linearVelocity, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IDirect3DDevice} 
     */
    get_Direct3D11Device() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DDevice(value)
    }

    /**
     * 
     * @returns {IDirect3DSurface} 
     */
    get_Direct3D11BackBuffer() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IDirect3DSurface(value)
    }
}
