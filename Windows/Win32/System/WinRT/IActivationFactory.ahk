#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IInspectable.ahk

/**
 * Enables classes to be activated by the Windows Runtime.
 * @remarks
 * 
 * Implement the <b>IActivationFactory</b> interface when you create a class that you want Windows Runtime  applications to use. Clients call the <a href="https://docs.microsoft.com/windows/desktop/api/activation/nf-activation-iactivationfactory-activateinstance">ActivateInstance</a>method to use an instance of your class. 
 * 
 * You can get an <b>IActivationFactory</b> pointer by calling the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/nf-roapi-rogetactivationfactory">RoGetActivationFactory</a> function.  
 * 
 * During activation of a class, the Windows Runtime calls the <a href="https://docs.microsoft.com/previous-versions/br205771(v=vs.85)">DllGetActivationFactory</a> function to get an <b>IActivationFactory</b> pointer that corresponds to the requested class.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//activation/nn-activation-iactivationfactory
 * @namespace Windows.Win32.System.WinRT
 * @version v4.0.30319
 */
class IActivationFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivationFactory
     * @type {Guid}
     */
    static IID => Guid("{00000035-0000-0000-c000-000000000046}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ActivateInstance"]

    /**
     * Creates a new instance of the Windows Runtime class that is associated with the current activation factory.
     * @returns {IInspectable} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a>**</b>
     * 
     * A pointer to a new instance of the class that is associated with the current activation factory.
     * @see https://docs.microsoft.com/windows/win32/api//activation/nf-activation-iactivationfactory-activateinstance
     */
    ActivateInstance() {
        result := ComCall(6, this, "ptr*", &instance := 0, "HRESULT")
        return IInspectable(instance)
    }
}
