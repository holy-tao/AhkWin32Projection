#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The Commit method invalidates a Video Present Network (VidPN) on all graphics adapters.
 * @remarks
 * After <b>Commit</b> succeeds, the sources and targets on all of the graphics adapters are set. 
 * 
 * TMM calls <b>Commit</b> whenever a set of operations must be applied. For example, TMM might call <b>Commit</b> after a call to the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568174(v=vs.85)">IViewHelper::SetActiveTopology</a> method on a graphics adapter that requires for a source and targets to be mapped. TMM does not pass in the adapter name to <b>Commit</b> because the VidPN on all adapters should be invalidated. 
 * 
 * A call to <b>Commit</b> will no longer replace a call to <b>ChangeDisplaySettingsEx</b>(<b>NULL</b>, <b>NULL</b>, <b>NULL</b>, 0, <b>NULL</b>). However, TMM always ends its graphics operations with a <b>Commit</b> call. For more information about <b>ChangeDisplaySettingsEx</b>, see the Microsoft Windows SDK documentation.
 * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-commit
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class IViewHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IViewHelper
     * @type {Guid}
     */
    static IID => Guid("{e85ccef5-aaaa-47f0-b5e3-61f7aecdc4c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetConnectedIDs", "GetActiveTopology", "SetActiveTopology", "Commit", "SetConfiguration", "GetProceedOnNewConfiguration"]

    /**
     * The GetConnectedIDs method retrieves, for a given adapter, an array of identifiers for either targets or sources.
     * @remarks
     * <b>GetConnectedIDs</b> is used to determine if two monitors that are connected to a graphics adapter can be placed into clone view.
     * 
     *  To qualify as a target, a monitor or other display device must be connected to the computer. For example, consider a graphics adapter with a Digital Video Interface (DVI) connector that supports output through DVI analog and DVI digital. <b>GetConnectedIDs</b> reports the target identifier of the DVI analog or DVI digital output connector only if a monitor is plugged into that connector. Therefore, a report of targets is not a report of all of the outputs that are available through the video ports. Rather, it is a report of what is physically attached to the graphics adapter. Each monitor is reported as a target whether the monitor is active or not.
     * 
     * In the first call to <b>GetConnectedIDs</b>, the <i>pulID </i> parameter is set to <b>NULL</b>, and the number of entries in the array of identifiers is retrieved in the variable that the <i>pulCount</i> parameter points to. In the second call to <b>GetConnectedIDs</b>, the number of entries that was retrieved in the first call is passed in the variable that <i>pulCount</i> points to, and an allocated array is passed to <i>pulCount</i>. This allocated array receives the identifiers of the targets or sources. 
     * 
     * <b>GetConnectedIDs</b> is called when a new second monitor is detected. The <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568174(v=vs.85)">IViewHelper::SetActiveTopology</a> method must then be called to set the display on the adapter to clone view. The adapter name is the string that was obtained from the <b>DeviceKey</b> member of the DISPLAY_DEVICE structure in a call to the <b>EnumDisplayDevices</b> function. For more information about DISPLAY_DEVICE and <b>EnumDisplayDevices</b>, see the Windows SDK documentation.
     * @param {PWSTR} wszAdaptorName [in] A NULL-terminated string that indicates the name of the adapter to retrieve identifiers for. The adapter name is obtained from the <b>DeviceKey</b> member of the DISPLAY_DEVICE structure. The adapter name was set in and returned from a call to the <b>EnumDisplayDevices</b> function. For more information about DISPLAY_DEVICE and <b>EnumDisplayDevices</b>, see the Microsoft Windows SDK documentation.
     * @param {Pointer<Integer>} pulCount [in,out] A pointer to a variable that receives the number of entries in the array that will be subsequently returned in the buffer that <i>pulID</i> points to. For more information about how array entries are retrieved, see the Remarks section.
     * @param {Pointer<Integer>} pulID [in,out] A pointer to a buffer that receives the array of identifiers for the targets or sources.
     * @param {Integer} ulFlags 
     * @returns {HRESULT} The <b>GetConnectedIDs</b> method returns one of the following values: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>GetConnectedIDs</b> successfully retrieved identifiers. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>ulFlags</i> parameter contained an unknown value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the pointer parameters is set to <b>NULL</b> when it should not be set to <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GRAPHICS_INVALID_DISPLAY_ADAPTER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>GetConnectedIDs</b> could not match the adapter name in the <i>wszAdaptorName</i> string to an existing graphics adapter's name. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GRAPHICS_OPM_PARAMETER_ARRAY_TOO_SMALL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array that was passed in the <i>pulID</i> parameter cannot hold all of the data that <b>GetConnectedIDs</b> must insert. TMM will then query for the number of array elements again. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Any other error code (that is defined in <i>Winerror.h</i>) will cause TMM to not act on the retrieved data.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-getconnectedids
     */
    GetConnectedIDs(wszAdaptorName, pulCount, pulID, ulFlags) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        pulIDMarshal := pulID is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", wszAdaptorName, pulCountMarshal, pulCount, pulIDMarshal, pulID, "uint", ulFlags, "HRESULT")
        return result
    }

    /**
     * The GetActiveTopology method retrieves, for a given adapter, an array of identifiers for targets that are active on a given source.
     * @remarks
     * <b>GetActiveTopology</b> is used to record the configuration that TMM will subsequently use in a call to the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568174(v=vs.85)">IViewHelper::SetActiveTopology</a> method to restore the configuration. 
     * 
     * For a given source identifier and adapter name, TMM calls <b>GetActiveTopology</b> twice. In the first call to <b>GetActiveTopology</b> , the <i>pulTargetID</i> parameter is set to <b>NULL</b>, and the number of entries in the array of active target identifiers is retrieved in the variable that the <i>pulCount</i> parameter points to. In the second call to <b>GetActiveTopology</b>, the number of entries that was retrieved in the first call is passed in the variable that <i>pulCount</i> points to, and an allocated array is passed to <i>pulTargetID</i>. This allocated array receives the identifiers of the active targets. 
     * 
     * TMM calls <b>GetActiveTopology</b> to record the display configuration that TMM will then use to reestablish the display configuration at a later time if a call to the Win32 <b>ChangeDisplaySettingsEx</b> function alone is not sufficient. For example, if a graphics adapter is set with two or more targets that are mapped to the same source (that is, clone view), the adapter name is the string that was obtained from the <b>DeviceKey</b> member of the DISPLAY_DEVICE structure in a call to the <b>EnumDisplayDevices</b> function. For more information about <b>ChangeDisplaySettingsEx</b>, DISPLAY_DEVICE, and <b>EnumDisplayDevices</b>, see the Windows SDK documentation.
     * @param {PWSTR} wszAdaptorName [in] A NULL-terminated string that indicates the name of the adapter to retrieve identifiers for. The adapter name is obtained from the <b>DeviceKey</b> member of the DISPLAY_DEVICE structure. The adapter name was set in and returned from a call to the <b>EnumDisplayDevices</b> function. For more information about DISPLAY_DEVICE and <b>EnumDisplayDevices</b>, see the Microsoft Windows SDK documentation.
     * @param {Integer} ulSourceID [in] A ULONG that is set to the source identifier whose configuration <b>GetActiveTopology</b> retrieves.
     * @param {Pointer<Integer>} pulCount [in,out] A pointer to a variable that receives the number of active target entries in the array that will be subsequently returned in the buffer that <i>pulTargetID</i> points to. For more information about how array entries are retrieved, see the Remarks section.
     * @param {Pointer<Integer>} pulTargetID [in,out] A pointer to a buffer that receives the array of identifiers for the active targets.
     * @returns {HRESULT} The <b>GetActiveTopology</b> method returns one of the following values: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>GetActiveTopology</b> successfully retrieved identifiers. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the pointer parameters is set to <b>NULL</b> when it should not be set to <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source identifier that is specified in the <i>ulSourceID</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GRAPHICS_INVALID_DISPLAY_ADAPTER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>GetActiveTopology</b> could not match the adapter name in the <i>wszAdaptorName</i> string to an existing graphics adapter's name. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GRAPHICS_OPM_PARAMETER_ARRAY_TOO_SMALL </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The array that was passed in the <i>pulTargetID</i> parameter cannot hold all of the data that <b>GetActiveTopology</b> must insert. TMM will then query for the number of array elements again. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Any other error code (that is defined in <i>Winerror.h</i>) will cause TMM to not act on the retrieved data.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-getactivetopology
     */
    GetActiveTopology(wszAdaptorName, ulSourceID, pulCount, pulTargetID) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulCountMarshal := pulCount is VarRef ? "uint*" : "ptr"
        pulTargetIDMarshal := pulTargetID is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", wszAdaptorName, "uint", ulSourceID, pulCountMarshal, pulCount, pulTargetIDMarshal, pulTargetID, "HRESULT")
        return result
    }

    /**
     * The SetActiveTopology method sets up the topology to be used by a Video Present Network (VidPN) on a particular graphics adapter.
     * @remarks
     * <b>SetActiveTopology</b> uses the data that was received from a previous call to the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568169(v=vs.85)">IViewHelper::GetActiveTopology</a> method. 
     * 
     * For the topology that the <b>SetActiveTopology</b> parameters specify to take affect, the VidPN must be invalidated through a call to the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568167(v=vs.85)">IViewHelper::Commit</a> method. 
     * 
     * <b>SetActiveTopology</b> is used only when a display configuration that cannot be established through a call to the Win32 <b>ChangeDisplaySettingsEx</b> function must be set. For example, for clone view on a graphics adapter, the adapter name is the string that was obtained from the <b>DeviceKey</b> member of the DISPLAY_DEVICE structure in a call to the <b>EnumDisplayDevices</b> function. For more information about <b>ChangeDisplaySettingsEx</b>, DISPLAY_DEVICE, and <b>EnumDisplayDevices</b>, see the Windows SDK documentation.
     * @param {PWSTR} wszAdaptorName [in] A NULL-terminated string that indicates the name of the adapter to set up the topology on. The adapter name is obtained from the <b>DeviceKey</b> member of the DISPLAY_DEVICE structure. The adapter name is set in and returned from a call to the <b>EnumDisplayDevices</b> function. For more information about DISPLAY_DEVICE and <b>EnumDisplayDevices</b>, see the Microsoft Windows SDK documentation.
     * @param {Integer} ulSourceID [in] A ULONG that is set to the source identifier for the display configuration that <b>SetActiveTopology</b> sets.
     * @param {Integer} ulCount [in] A ULONG that contains the number of active target entries in the array that <i>pulTargetID</i> specifies.
     * @param {Pointer<Integer>} pulTargetID [in] An array of identifiers for the active targets.
     * @returns {HRESULT} The <b>SetActiveTopology</b> method returns one of the following values: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>SetActiveTopology</b> successfully set up the topology. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The pointer parameter (<i>pulTargetID</i>) is set to <b>NULL</b> when it should not be set to <b>NULL</b>. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The source identifier that is specified in the <i>ulSourceID</i> parameter is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GRAPHICS_INVALID_DISPLAY_ADAPTER </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>SetActiveTopology</b> could not match the adapter name in the <i>wszAdaptorName</i> string to an existing graphics adapter's name. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more of the targets that are identified by the entries in the array that <i>pulTargetID</i> specifies are invalid. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_GRAPHICS_PATH_NOT_IN_TOPOLOGY </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The VidPN cannot establish the topology. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Any other error code (that is defined in <i>Winerror.h</i>) will cause TMM to not restore connections.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-setactivetopology
     */
    SetActiveTopology(wszAdaptorName, ulSourceID, ulCount, pulTargetID) {
        wszAdaptorName := wszAdaptorName is String ? StrPtr(wszAdaptorName) : wszAdaptorName

        pulTargetIDMarshal := pulTargetID is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", wszAdaptorName, "uint", ulSourceID, "uint", ulCount, pulTargetIDMarshal, pulTargetID, "HRESULT")
        return result
    }

    /**
     * The Commit method invalidates a Video Present Network (VidPN) on all graphics adapters.
     * @remarks
     * After <b>Commit</b> succeeds, the sources and targets on all of the graphics adapters are set. 
     * 
     * TMM calls <b>Commit</b> whenever a set of operations must be applied. For example, TMM might call <b>Commit</b> after a call to the <a href="https://docs.microsoft.com/previous-versions/windows/hardware/drivers/ff568174(v=vs.85)">IViewHelper::SetActiveTopology</a> method on a graphics adapter that requires for a source and targets to be mapped. TMM does not pass in the adapter name to <b>Commit</b> because the VidPN on all adapters should be invalidated. 
     * 
     * A call to <b>Commit</b> will no longer replace a call to <b>ChangeDisplaySettingsEx</b>(<b>NULL</b>, <b>NULL</b>, <b>NULL</b>, 0, <b>NULL</b>). However, TMM always ends its graphics operations with a <b>Commit</b> call. For more information about <b>ChangeDisplaySettingsEx</b>, see the Microsoft Windows SDK documentation.
     * @returns {HRESULT} The <b>Commit</b> method returns one of the following values: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>Commit</b> successfully invalidated a VidPN. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>Any other error code (that is defined in <i>Winerror.h</i>) will cause TMM to not restore connections.</b></dt>
     * </dl>
     * </td>
     * <td width="60%"></td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-commit
     */
    Commit() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * The SetConfiguration method passes in display data (display modes and topology data) to the underlying user-mode display driver that the driver should set.
     * @remarks
     * After <b>SetConfiguration</b> passes display data to the underlying user-mode display driver, the driver can modify or fold in new data before setting the display. 
     * 
     * <b>SetConfiguration</b> is called when TMM must change the display settings and topology to match a known state that was last recorded by TMM. 
     * 
     * The following data structures are used to format the display modes and topology data that the <b>IStream</b> object that the <i>pIStream</i> parameter points to contains:
     * 
     * <ul>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-sources">Sources</a>
     * 
     * 
     * </li>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-adapter">Adapter</a>
     * 
     * 
     * </li>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-adapters">Adapters</a>
     * 
     * 
     * </li>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-displaymode">DisplayMode</a>
     * 
     * 
     * </li>
     * <li>
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/cloneviewhelper/ns-cloneviewhelper-displaymodes">DisplayModes</a>
     * 
     * 
     * </li>
     * </ul>
     * These structures are defined in the <i>Cloneviewhelper.h</i>.
     * @param {IStream} pIStream [in] A pointer to an <b>IStream</b> interface. The <b>IStream</b> object contains display modes and topology data that are formatted by using the data structures in the <i>Cloneviewhelper.h</i> header file. When the <b>Release</b> method of <b>IStream</b> is called, the memory that backs the <b>IStream</b> is freed. TMM will call <b>Release</b> on the <b>IStream</b> interface pointer if <b>SetConfiguration</b> returns an error result. Otherwise, the user-mode display driver should call <b>Release</b>. <b>Release</b> is called to free the memory that was allocated to store the view information. For more information about <b>IStream</b>, see the Microsoft Windows SDK documentation.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-setconfiguration
     */
    SetConfiguration(pIStream) {
        result := ComCall(7, this, "ptr", pIStream, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * The GetProceedOnNewConfiguration method allows the user-mode display driver to suppress the TMM user interface and display changing actions on a new, two-monitor configuration.
     * @remarks
     * <b>GetProceedOnNewConfiguration</b> is called only when an HPD event occurs and TMM encounters a new configuration (that is, a configuration for which TMM does not yet have a profile).
     * @returns {HRESULT} The <b>GetProceedOnNewConfiguration</b> method returns one of the following values: 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The TMM user interface can appear.
     * 
     * TMM proceeds with its operations, defaulting to clone view if the current display configuration is in single view. TMM will also open a dialog. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Both TMM actions and user interface should be suppressed.
     * 
     * TMM will not actively change any display settings and will not show a user interface. The only conditions under which returning S_FALSE are allowed are:
     * 
     * <ul>
     * <li>
     * The state change for displays was caused by a user pressing a keyboard shortcut (that is, Fn key combinations). For example, if the user presses a keyboard shortcut to switch views, the  user-mode display driver might have its own user interface to present to the user. In this situation, if the user-mode display driver must suppress TMM actions, this return code can be used to inform TMM. 
     * 
     * </li>
     * <li>
     * The state change for displays was caused by user input from the user-mode display driver's user interface. For example, if the user opens a program that was created by the hardware vendor to manually change the connected and active state, an HPD might be generated. In this situation, this return code will prevent TMM from taking action and conflicting with the user's manual input. The driver will then handle the display change. 
     * 
     * </li>
     * </ul>
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_INIT </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Only TMM actions are suppressed. However, TMM user interface is shown.
     * 
     * TMM will not actively change any display settings but can show its user interface. The user-mode display driver has the opportunity to set predefined configurations. However, TMM user interface can still be shown, which allows users to customize the display settings if they do not like the default. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/cloneviewhelper/nf-cloneviewhelper-iviewhelper-getproceedonnewconfiguration
     */
    GetProceedOnNewConfiguration() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
