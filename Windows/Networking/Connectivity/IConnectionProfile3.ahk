#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\AttributedNetworkUsage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IConnectionProfile3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectionProfile3
     * @type {Guid}
     */
    static IID => Guid("{578c2528-4cd9-4161-8045-201cfd5b115c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAttributedNetworkUsageAsync"]

    /**
     * 
     * @param {DateTime} startTime 
     * @param {DateTime} endTime 
     * @param {NetworkUsageStates} states 
     * @returns {IAsyncOperation<IVectorView<AttributedNetworkUsage>>} 
     */
    GetAttributedNetworkUsageAsync(startTime, endTime, states) {
        result := ComCall(6, this, "ptr", startTime, "ptr", endTime, "ptr", states, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, AttributedNetworkUsage), value)
    }
}
