#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ConnectionProfile.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class INetworkInformationStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetworkInformationStatics2
     * @type {Guid}
     */
    static IID => Guid("{459ced14-2832-49b6-ba6e-e265f04786a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindConnectionProfilesAsync"]

    /**
     * 
     * @param {ConnectionProfileFilter} pProfileFilter 
     * @returns {IAsyncOperation<IVectorView<ConnectionProfile>>} 
     */
    FindConnectionProfilesAsync(pProfileFilter) {
        result := ComCall(6, this, "ptr", pProfileFilter, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ConnectionProfile), value)
    }
}
