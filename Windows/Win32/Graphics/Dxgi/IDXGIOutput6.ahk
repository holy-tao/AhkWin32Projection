#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_OUTPUT_DESC1.ahk
#Include .\IDXGIOutput5.ahk

/**
 * Represents an adapter output (such as a monitor). The IDXGIOutput6 interface exposes methods to provide specific monitor capabilities.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_6/nn-dxgi1_6-idxgioutput6
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput6 extends IDXGIOutput5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutput6
     * @type {Guid}
     */
    static IID => Guid("{068346e8-aaec-4b84-add7-137f513f77a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1", "CheckHardwareCompositionSupport"]

    /**
     * Get an extended description of the output that includes color characteristics and connection type.
     * @remarks
     * Some scenarios do not have well-defined values for all fields in this struct. For example, if this IDXGIOutput represents a clone/duplicate set, or if the EDID has missing or invalid data. In these cases, the OS will provide some default values that correspond to a standard SDR display.
     * 
     * An output's reported color and luminance characteristics can adjust dynamically while the system is running due to user action or changing ambient conditions. Therefore, apps should periodically query **IDXGIFactory::IsCurrent** and re-create their **IDXGIFactory** if it returns **FALSE**. Then re-query **GetDesc1** from the new factory's equivalent output to retrieve the newest color information.
     * 
     * For more details on how to write apps that react dynamically to monitor capabilities, see [Using DirectX with high dynamic range displays and Advanced Color](/windows/win32/direct3darticles/high-dynamic-range). 
     * 
     * On a high DPI desktop, <b>GetDesc1</b> returns the visualized screen size unless the app is marked high DPI aware. For info about writing DPI-aware Win32 apps, see <a href="https://docs.microsoft.com/windows/desktop/hidpi/high-dpi-desktop-application-development-on-windows">High DPI</a>.
     * @returns {DXGI_OUTPUT_DESC1} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/ns-dxgi1_6-dxgi_output_desc1">DXGI_OUTPUT_DESC1</a>*</b>
     * 
     * A pointer to the output description (see <a href="https://docs.microsoft.com/windows/win32/api/dxgi1_6/ns-dxgi1_6-dxgi_output_desc1">DXGI_OUTPUT_DESC1</a>).
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_6/nf-dxgi1_6-idxgioutput6-getdesc1
     */
    GetDesc1() {
        pDesc := DXGI_OUTPUT_DESC1()
        result := ComCall(27, this, "ptr", pDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDesc
    }

    /**
     * Notifies applications that hardware stretching is supported.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A bitfield of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_6/ne-dxgi1_6-dxgi_hardware_composition_support_flags">DXGI_HARDWARE_COMPOSITION_SUPPORT_FLAGS</a> enumeration values describing which types of hardware composition are supported. The values are bitwise OR'd together.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_6/nf-dxgi1_6-idxgioutput6-checkhardwarecompositionsupport
     */
    CheckHardwareCompositionSupport() {
        result := ComCall(28, this, "uint*", &pFlags := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pFlags
    }
}
