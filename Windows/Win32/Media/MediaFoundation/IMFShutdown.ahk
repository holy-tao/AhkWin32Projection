#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposed by some Media Foundation objects that must be explicitly shut down.
 * @remarks
 * 
 * The following types of object expose <b>IMFShutdown</b>:
 * 
 * <ul>
 * <li>Content enablers (<a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfcontentenabler">IMFContentEnabler</a> interface)
 *           </li>
 * <li>Input trust authorities (<a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfinputtrustauthority">IMFInputTrustAuthority</a> interface)
 *           </li>
 * <li>Presentation clocks (<a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nn-mfidl-imfpresentationclock">IMFPresentationClock</a> interface)
 *           </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/medfound/asynchronous-mfts">Asynchronous MFTs</a>
 * </li>
 * </ul>
 * Any component that creates one of these objects is responsible for calling <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfshutdown-shutdown">Shutdown</a> on the object before releasing the object. Typically, applications do not create any of these objects directly, so it is not usually necessary to use this interface in an application.
 *       
 * 
 * To obtain a pointer to this interface, call <b>QueryInterface</b> on the object.
 *       
 * 
 * If you are implementing a custom object, your object can expose this interface, but only if you can guarantee that your application will call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfshutdown-shutdown">Shutdown</a>. 
 * 
 * Media sources, media sinks, and <i>synchronous</i> MFTs should not implement this interface, because the Media Foundation pipeline will not call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfshutdown-shutdown">Shutdown</a> on these objects.
 *       Asynchronous MFTs must implement this interface.
 * 
 * This interface is not related to the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfshutdown">MFShutdown</a> function, which shuts down the Media Foundation platform, as described in <a href="https://docs.microsoft.com/windows/desktop/medfound/initializing-media-foundation">Initializing Media Foundation</a>.
 *       
 * 
 * Some Media Foundation interfaces define a <b>Shutdown</b> method, which serves the same purpose as <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfshutdown-shutdown">IMFShutdown::Shutdown</a> but is not directly related to it.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfshutdown
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFShutdown extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFShutdown
     * @type {Guid}
     */
    static IID => Guid("{97ec2ea4-0e42-4937-97ac-9d6d328824e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Shutdown", "GetShutdownStatus"]

    /**
     * Shuts down a Media Foundation object and releases all resources associated with the object.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfshutdown-shutdown
     */
    Shutdown() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Queries the status of an earlier call to the IMFShutdown::Shutdown method.
     * @returns {Integer} Receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mfshutdown_status">MFSHUTDOWN_STATUS</a> enumeration.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfshutdown-getshutdownstatus
     */
    GetShutdownStatus() {
        result := ComCall(4, this, "int*", &pStatus := 0, "HRESULT")
        return pStatus
    }
}
