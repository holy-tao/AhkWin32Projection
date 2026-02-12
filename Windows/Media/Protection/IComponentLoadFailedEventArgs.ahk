#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RevocationAndRenewalInformation.ahk
#Include .\MediaProtectionServiceCompletion.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection
 * @version WindowsRuntime 1.4
 */
class IComponentLoadFailedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IComponentLoadFailedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{95972e93-7746-417e-8495-f031bbc5862c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Information", "get_Completion"]

    /**
     * @type {RevocationAndRenewalInformation} 
     */
    Information {
        get => this.get_Information()
    }

    /**
     * @type {MediaProtectionServiceCompletion} 
     */
    Completion {
        get => this.get_Completion()
    }

    /**
     * 
     * @returns {RevocationAndRenewalInformation} 
     */
    get_Information() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RevocationAndRenewalInformation(value)
    }

    /**
     * 
     * @returns {MediaProtectionServiceCompletion} 
     */
    get_Completion() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MediaProtectionServiceCompletion(value)
    }
}
