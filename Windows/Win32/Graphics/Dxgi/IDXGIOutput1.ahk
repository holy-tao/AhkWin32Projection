#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\DXGI_MODE_DESC1.ahk
#Include .\IDXGIOutputDuplication.ahk
#Include .\IDXGIOutput.ahk

/**
 * An IDXGIOutput1 interface represents an adapter output (such as a monitor).
 * @remarks
 * To determine  the outputs that are available from the adapter, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiadapter-enumoutputs">IDXGIAdapter::EnumOutputs</a>. To determine the specific output that the swap chain will update, use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgiswapchain-getcontainingoutput">IDXGISwapChain::GetContainingOutput</a>. You can then call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> from any  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgioutput">IDXGIOutput</a> object to obtain an <b>IDXGIOutput1</b> object.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nn-dxgi1_2-idxgioutput1
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
     * Gets the display modes that match the requested format and other input options. (IDXGIOutput1.GetDisplayModeList1)
     * @remarks
     * <b>GetDisplayModeList1</b> is updated from  <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdisplaymodelist">GetDisplayModeList</a> to return a list of <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_mode_desc1">DXGI_MODE_DESC1</a> structures, which are updated mode descriptions.  <b>GetDisplayModeList</b> behaves as though it calls <b>GetDisplayModeList1</b> because  <b>GetDisplayModeList</b> can return all of the modes that are specified by <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-enum-modes">DXGI_ENUM_MODES</a>, including stereo mode.  However, <b>GetDisplayModeList</b> returns a list of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/bb173064(v=vs.85)">DXGI_MODE_DESC</a> structures, which are the former mode descriptions and do not indicate stereo mode.
     * 
     * The <b>GetDisplayModeList1</b> method does not enumerate stereo modes unless you specify the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-enum-modes">DXGI_ENUM_MODES_STEREO</a> flag in the <i>Flags</i> parameter.  If you specify DXGI_ENUM_MODES_STEREO, stereo modes are included in the list of returned modes that the <i>pDesc</i> parameter points to.  In other words, the method returns both stereo and mono modes.
     * 
     * In general, when you switch from windowed to full-screen mode, a swap chain automatically chooses a display mode that meets (or exceeds) the resolution, color 
     *       depth, and refresh rate of the swap chain. To exercise more control over the display mode, use <b>GetDisplayModeList1</b> to poll the set of display modes that are validated 
     *       against monitor capabilities, or all modes that match the desktop (if the desktop settings are not validated against the monitor).
     * 
     * The following example code shows that you need to call <b>GetDisplayModeList1</b> twice. First call <b>GetDisplayModeList1</b> to get the number of modes available, and second call <b>GetDisplayModeList1</b> to return a description of the modes.
     * 
     * 
     * ```
     * 
     * UINT num = 0;
     * DXGI_FORMAT format = DXGI_FORMAT_R32G32B32A32_FLOAT;
     * UINT flags         = DXGI_ENUM_MODES_INTERLACED;
     * 
     * pOutput->GetDisplayModeList1( format, flags, &num, 0);
     * 
     * ...
     * 
     * DXGI_MODE_DESC1 * pDescs = new DXGI_MODE_DESC1[num];
     * pOutput->GetDisplayModeList1( format, flags, &num, pDescs);
     *       
     * ```
     * @param {Integer} EnumFormat A <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT</a>-typed value for the color format.
     * @param {Integer} Flags A combination of <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-enum-modes">DXGI_ENUM_MODES</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies options for display modes to include. You must specify DXGI_ENUM_MODES_SCALING to expose the display modes that require scaling.  Centered modes that require no 
     *             scaling and correspond directly to the display output are enumerated by default.
     * @param {Pointer<Integer>} pNumModes A pointer to a variable that receives the number of display modes that <b>GetDisplayModeList1</b> returns in the memory block to which <i>pDesc</i> points. Set <i>pDesc</i> to <b>NULL</b> so that <i>pNumModes</i> returns the number of display modes that match the format and the options.
     *         Otherwise, <i>pNumModes</i> returns the number of display modes returned in <i>pDesc</i>.
     * @returns {DXGI_MODE_DESC1} A pointer to a list of display modes; set to <b>NULL</b> to get the number of display modes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutput1-getdisplaymodelist1
     */
    GetDisplayModeList1(EnumFormat, Flags, pNumModes) {
        pNumModesMarshal := pNumModes is VarRef ? "uint*" : "ptr"

        pDesc := DXGI_MODE_DESC1()
        result := ComCall(19, this, "int", EnumFormat, "uint", Flags, pNumModesMarshal, pNumModes, "ptr", pDesc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pDesc
    }

    /**
     * Finds the display mode that most closely matches the requested display mode. (IDXGIOutput1.FindClosestMatchingMode1)
     * @remarks
     * Direct3D devices require UNORM formats.
     * 
     * <b>FindClosestMatchingMode1</b> finds the closest matching available display mode to the mode that you specify in <i>pModeToMatch</i>.
     * 
     * If you set the <b>Stereo</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_mode_desc1">DXGI_MODE_DESC1</a> structure to which <i>pModeToMatch</i> points to specify a stereo mode as input, <b>FindClosestMatchingMode1</b> considers only stereo modes. <b>FindClosestMatchingMode1</b> considers only mono modes if <b>Stereo</b> is not set.
     * 
     * <b>FindClosestMatchingMode1</b> resolves similarly ranked members of display modes (that is, all specified, or all unspecified, and so on) in the following order:
     * 
     * <ol>
     * <li><b>ScanlineOrdering</b></li>
     * <li><b>Scaling</b></li>
     * <li><b>Format</b></li>
     * <li><b>Resolution</b></li>
     * <li><b>RefreshRate</b></li>
     * </ol>
     * When <b>FindClosestMatchingMode1</b> determines the closest value for a particular member, it uses previously matched members to filter the display mode list choices, and 
     *       ignores other members. For example, when <b>FindClosestMatchingMode1</b> matches <b>Resolution</b>, it already filtered the display mode list by a certain <b>ScanlineOrdering</b>, 
     *       <b>Scaling</b>, and <b>Format</b>, while it ignores <b>RefreshRate</b>. This ordering doesn't define the absolute ordering for every usage scenario of <b>FindClosestMatchingMode1</b>, because 
     *       the application can choose some values initially, which effectively changes the order of resolving members.
     * 
     * <b>FindClosestMatchingMode1</b> matches members of the display mode one at a time, generally in a specified order.
     * 
     * If a member is unspecified, <b>FindClosestMatchingMode1</b> gravitates toward the values for the desktop related to this output. 
     *       If this output is not part of the desktop, <b>FindClosestMatchingMode1</b> uses the default desktop output to find values. If an application uses a fully unspecified 
     *       display mode, <b>FindClosestMatchingMode1</b> typically returns a display mode that matches the desktop settings for this output.  
     *       Because unspecified members are lower priority than specified members, <b>FindClosestMatchingMode1</b> resolves unspecified members later than specified members.
     * @param {Pointer<DXGI_MODE_DESC1>} pModeToMatch A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/ns-dxgi1_2-dxgi_mode_desc1">DXGI_MODE_DESC1</a> structure that describes the display mode to match. Members of <b>DXGI_MODE_DESC1</b> can be unspecified, which indicates no preference for 
     *         that member.  A value of 0 for <b>Width</b> or <b>Height</b> indicates that the value is unspecified.  If either <b>Width</b> or 
     *         <b>Height</b> is 0, both must be 0.  A numerator and denominator of 0 in <b>RefreshRate</b> indicate it is unspecified. Other members 
     *         of <b>DXGI_MODE_DESC1</b> have enumeration values that indicate that the member is unspecified.  If <i>pConcernedDevice</i> is <b>NULL</b>, the <b>Format</b> member of <b>DXGI_MODE_DESC1</b> cannot be <b>DXGI_FORMAT_UNKNOWN</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutput1-findclosestmatchingmode1
     */
    FindClosestMatchingMode1(pModeToMatch, pConcernedDevice) {
        pClosestMatch := DXGI_MODE_DESC1()
        result := ComCall(20, this, "ptr", pModeToMatch, "ptr", pClosestMatch, "ptr", pConcernedDevice, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pClosestMatch
    }

    /**
     * Copies the display surface (front buffer) to a user-provided resource.
     * @remarks
     * <b>GetDisplaySurfaceData1</b> is similar to <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata">IDXGIOutput::GetDisplaySurfaceData</a> except <b>GetDisplaySurfaceData1</b> takes an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgiresource">IDXGIResource</a> and <b>IDXGIOutput::GetDisplaySurfaceData</b> takes an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>.
     * 
     * <b>GetDisplaySurfaceData1</b> returns an error if the input resource is not a 2D texture (represented by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11texture2d">ID3D11Texture2D</a> interface) with an array size (<b>ArraySize</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a> structure) that is equal to the swap chain buffers.
     * 
     * The original <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata">IDXGIOutput::GetDisplaySurfaceData</a> and the updated <b>GetDisplaySurfaceData1</b> behave exactly the same. <b>GetDisplaySurfaceData1</b> was required because textures with an array size equal to 2 (<b>ArraySize</b> = 2) do not implement <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>.
     * 
     * You can call <b>GetDisplaySurfaceData1</b> only when an output is in full-screen mode. If <b>GetDisplaySurfaceData1</b> succeeds, it fills the destination resource.
     * 
     * Use <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdesc">IDXGIOutput::GetDesc</a> to determine the size (width and height) of the output when you want to allocate space for the destination resource. This is true regardless of target monitor rotation. A destination resource created by a graphics component (such as Direct3D 11) must be created with CPU write permission (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_cpu_access_flag">D3D11_CPU_ACCESS_WRITE</a>). Other surfaces can be created with CPU read-write permission (<b>D3D11_CPU_ACCESS_READ</b> | <b>D3D11_CPU_ACCESS_WRITE</b>). <b>GetDisplaySurfaceData1</b> modifies the surface data to fit the destination resource (stretch, shrink, convert format, rotate). <b>GetDisplaySurfaceData1</b> performs the stretch and shrink with point sampling.
     * @param {IDXGIResource} pDestination A pointer to a resource interface that represents the resource to which <b>GetDisplaySurfaceData1</b> copies the display surface.
     * @returns {HRESULT} Returns one of the error codes described in the <a href="https://docs.microsoft.com/windows/desktop/direct3ddxgi/dxgi-error">DXGI_ERROR</a> topic.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutput1-getdisplaysurfacedata1
     */
    GetDisplaySurfaceData1(pDestination) {
        result := ComCall(21, this, "ptr", pDestination, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a desktop duplication interface from the IDXGIOutput1 interface that represents an adapter output.
     * @remarks
     * If an application wants to duplicate the entire desktop, it must create a desktop duplication interface on each active output on the desktop. This interface does not provide an explicit way to synchronize the timing of each output image. Instead, the application must use the time stamp of each output, and then determine how to combine the images.
     * 
     * For <b>DuplicateOutput</b> to succeed, you must create <i>pDevice</i> from <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgifactory1">IDXGIFactory1</a> or a later version of a DXGI factory interface that inherits from <b>IDXGIFactory1</b>.
     * 
     * If the current mode is a stereo mode, the desktop duplication interface provides the image for the left stereo image only.
     * 
     * By default, only four processes can use a <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface at the same time within a single session. A process can have only one desktop duplication interface on a single desktop output; however, that process can have a desktop duplication interface for each output that is part of the desktop. 
     * 
     * For improved performance, consider using <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_5/nf-dxgi1_5-idxgioutput5-duplicateoutput1">DuplicateOutput1</a>.
     * @param {IUnknown} pDevice A pointer to the Direct3D device interface that you can use to process the desktop image. This device must be created from the adapter to which the output is connected.
     * @returns {Pointer<IDXGIOutputDuplication>} A pointer to a variable that receives the new <a href="https://docs.microsoft.com/windows/desktop/api/dxgi1_2/nn-dxgi1_2-idxgioutputduplication">IDXGIOutputDuplication</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi1_2/nf-dxgi1_2-idxgioutput1-duplicateoutput
     */
    DuplicateOutput(pDevice) {
        result := ComCall(22, this, "ptr", pDevice, "ptr*", &ppOutputDuplication := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppOutputDuplication
    }
}
