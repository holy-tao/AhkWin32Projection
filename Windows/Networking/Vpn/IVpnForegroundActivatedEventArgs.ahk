#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\ValueSet.ahk
#Include .\VpnForegroundActivationOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnForegroundActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnForegroundActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{85b465b0-cadb-4d70-ac92-543a24dc9ebc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ProfileName", "get_SharedContext", "get_ActivationOperation"]

    /**
     * @type {HSTRING} 
     */
    ProfileName {
        get => this.get_ProfileName()
    }

    /**
     * @type {ValueSet} 
     */
    SharedContext {
        get => this.get_SharedContext()
    }

    /**
     * @type {VpnForegroundActivationOperation} 
     */
    ActivationOperation {
        get => this.get_ActivationOperation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ProfileName() {
        name := HSTRING()
        result := ComCall(6, this, "ptr", name, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return name
    }

    /**
     * 
     * @returns {ValueSet} 
     */
    get_SharedContext() {
        result := ComCall(7, this, "ptr*", &sharedContext := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueSet(sharedContext)
    }

    /**
     * 
     * @returns {VpnForegroundActivationOperation} 
     */
    get_ActivationOperation() {
        result := ComCall(8, this, "ptr*", &activationOperation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnForegroundActivationOperation(activationOperation)
    }
}
