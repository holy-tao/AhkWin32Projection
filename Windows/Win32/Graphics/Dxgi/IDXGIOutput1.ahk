#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_MODE_DESC1.ahk
#Include .\IDXGIOutputDuplication.ahk
#Include .\IDXGIOutput.ahk

/**
 * An IDXGIOutput1 interface represents an adapter output (such as a monitor).
 * @remarks
 * 
 * To determine  the outputs that are available from the adapter, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-enumoutputs">IDXGIAdapter::EnumOutputs</a>. To determine the specific output that the swap chain will update, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getcontainingoutput">IDXGISwapChain::GetContainingOutput</a>. You can then call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> from any  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> object to obtain an <b>IDXGIOutput1</b> object.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nn-dxgi1_2-idxgioutput1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGIOutput1 extends IDXGIOutput{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGIOutput1
     * @type {Guid}
     */
    static IID => Guid("{00cddea8-939b-4b83-a340-a685226666cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDisplayModeList1", "FindClosestMatchingMode1", "GetDisplaySurfaceData1", "DuplicateOutput"]

    /**
     * Gets the display modes that match the requested format and other input options.
     * @param {Integer} EnumFormat A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the color format.
     * @param {Integer} Flags A combination of <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-enum-modes">DXGI_ENUM_MODES</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for display modes to include. You must specify DXGI_ENUM_MODES_SCALING to expose the display modes that require scaling.  Centered modes that require no 
     *             scaling and correspond directly to the display output are enumerated by default.
     * @param {Pointer<Integer>} pNumModes A pointer to a variable that receives the number of display modes that <b>GetDisplayModeList1</b> returns in the memory block to which <i>pDesc</i> points. Set <i>pDesc</i> to <b>NULL</b> so that <i>pNumModes</i> returns the number of display modes that match the format and the options.
     *         Otherwise, <i>pNumModes</i> returns the number of display modes returned in <i>pDesc</i>.
     * @returns {DXGI_MODE_DESC1} A pointer to a list of display modes; set to <b>NULL</b> to get the number of display modes.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutput1-getdisplaymodelist1
     */
    GetDisplayModeList1(EnumFormat, Flags, pNumModes) {
        pNumModesMarshal := pNumModes is VarRef ? "uint*" : "ptr"

        pDesc := DXGI_MODE_DESC1()
        result := ComCall(19, this, "int", EnumFormat, "uint", Flags, pNumModesMarshal, pNumModes, "ptr", pDesc, "HRESULT")
        return pDesc
    }

    /**
     * Finds the display mode that most closely matches the requested display mode.
     * @param {Pointer<DXGI_MODE_DESC1>} pModeToMatch A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_mode_desc1">DXGI_MODE_DESC1</a> structure that describes the display mode to match. Members of <b>DXGI_MODE_DESC1</b> can be unspecified, which indicates no preference for 
     *         that member.  A value of 0 for <b>Width</b> or <b>Height</b> indicates that the value is unspecified.  If either <b>Width</b> or 
     *         <b>Height</b> is 0, both must be 0.  A numerator and denominator of 0 in <b>RefreshRate</b> indicate it is unspecified. Other members 
     *         of <b>DXGI_MODE_DESC1</b> have enumeration values that indicate that the member is unspecified.  If <i>pConcernedDevice</i> is <b>NULL</b>, the <b>Format</b>member of <b>DXGI_MODE_DESC1</b> cannot be <b>DXGI_FORMAT_UNKNOWN</b>.
     * @param {IUnknown} pConcernedDevice A pointer to the Direct3D device interface. If this parameter is <b>NULL</b>, <b>FindClosestMatchingMode1</b> returns only modes whose format matches that of <i>pModeToMatch</i>; otherwise, <b>FindClosestMatchingMode1</b> returns only those formats that are supported for scan-out by the device. For info about the formats that are supported for scan-out by the device at each feature level:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/hardware-support-for-direct3d-12-1-formats">DXGI Format  Support for Direct3D Feature Level 12.1 Hardware</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/hardware-support-for-direct3d-12-0-formats">DXGI Format  Support for Direct3D Feature Level 12.0 Hardware</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-11-1-feature-level-hardware">DXGI Format  Support for Direct3D Feature Level 11.1 Hardware</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-11-0-feature-level-hardware">DXGI Format  Support for Direct3D Feature Level 11.0 Hardware</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/ff471324(v=vs.85)">Hardware Support for Direct3D 10Level9 Formats</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-feature-level-10-1-hardware">Hardware Support for Direct3D 10.1 Formats</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/format-support-for-direct3d-feature-level-10-0-hardware">Hardware Support for Direct3D 10 Formats</a>
     * </li>
     * </ul>
     * @returns {DXGI_MODE_DESC1} A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_mode_desc1">DXGI_MODE_DESC1</a> structure that receives a description of the display mode that most closely matches the display mode described at <i>pModeToMatch</i>.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutput1-findclosestmatchingmode1
     */
    FindClosestMatchingMode1(pModeToMatch, pConcernedDevice) {
        pClosestMatch := DXGI_MODE_DESC1()
        result := ComCall(20, this, "ptr", pModeToMatch, "ptr", pClosestMatch, "ptr", pConcernedDevice, "HRESULT")
        return pClosestMatch
    }

    /**
     * Copies the display surface (front buffer) to a user-provided resource.
     * @param {IDXGIResource} pDestination A pointer to a resource interface that represents the resource to which <b>GetDisplaySurfaceData1</b> copies the display surface.
     * @returns {HRESULT} Returns one of the error codes described in the <a href="/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutput1-getdisplaysurfacedata1
     */
    GetDisplaySurfaceData1(pDestination) {
        result := ComCall(21, this, "ptr", pDestination, "HRESULT")
        return result
    }

    /**
     * Creates a desktop duplication interface from the IDXGIOutput1 interface that represents an adapter output.
     * @param {IUnknown} pDevice A pointer to the Direct3D device interface that you can use to process the desktop image. This device must be created from the adapter to which the output is connected.
     * @returns {IDXGIOutputDuplication} A pointer to a variable that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//dxgi1_2/nf-dxgi1_2-idxgioutput1-duplicateoutput
     */
    DuplicateOutput(pDevice) {
        result := ComCall(22, this, "ptr", pDevice, "ptr*", &ppOutputDuplication := 0, "HRESULT")
        return IDXGIOutputDuplication(ppOutputDuplication)
    }
}
