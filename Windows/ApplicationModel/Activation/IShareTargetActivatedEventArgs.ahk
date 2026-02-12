#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\DataTransfer\ShareTarget\ShareOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information for an application that is a target for share operations.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.isharetargetactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IShareTargetActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShareTargetActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{4bdaf9c8-cdb2-4acb-bfc3-6648563378ec}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ShareOperation"]

    /**
     * Contains information about data included in a share operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.isharetargetactivatedeventargs.shareoperation
     * @type {ShareOperation} 
     */
    ShareOperation {
        get => this.get_ShareOperation()
    }

    /**
     * 
     * @returns {ShareOperation} 
     */
    get_ShareOperation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ShareOperation(value)
    }
}
