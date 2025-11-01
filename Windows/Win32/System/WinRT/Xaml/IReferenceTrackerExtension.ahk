#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IReferenceTrackerExtension extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IReferenceTrackerExtension
     * @type {Guid}
     */
    static IID => Guid("{4e897caa-59d5-4613-8f8c-f7ebd1f399b0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
