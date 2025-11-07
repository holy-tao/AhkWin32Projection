#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Used by ShellExecuteEx and IContextMenu to allow the caller to alter some parameters of the process being created.
 * @remarks
 * 
 *  The caller should install an object into the site chain which implements <a href="https://docs.microsoft.com/dotnet/api/microsoft.visualstudio.shell.package.microsoft-visualstudio-ole-interop-iserviceprovider-queryservice?view=visualstudiosdk-2017">IServiceProvider::QueryService</a> and responds to the <b>SID_ExecuteCreatingProcess</b> service ID with an object that implements the <b>ICreatingProcess</b> interface.
 * 
 * After performing the desired operations, the object should forward the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-icreatingprocess-oncreating">ICreatingProcess::OnCreating</a> call up the site chain to allow other members of the site chain to participate.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-icreatingprocess
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ICreatingProcess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICreatingProcess
     * @type {Guid}
     */
    static IID => Guid("{c2b937a9-3110-4398-8a56-f34c6342d244}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCreating"]

    /**
     * 
     * @param {ICreateProcessInputs} pcpi 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-icreatingprocess-oncreating
     */
    OnCreating(pcpi) {
        result := ComCall(3, this, "ptr", pcpi, "HRESULT")
        return result
    }
}
