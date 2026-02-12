#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a way to represent the current object as a string.
 * @remarks
 * > [!IMPORTANT]
 * > Managed types should not implement the **IStringable** interface. For more info, see [The Windows Runtime and the IStringable Interface](/dotnet/fundamentals/runtime-libraries/system-object-tostring#the-windows-runtime-and-the-istringable-interface).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.istringable
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IStringable extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStringable
     * @type {Guid}
     */
    static IID => Guid("{96369f54-8eb6-48f0-abce-c1b211e627c3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ToString"]

    /**
     * Gets a string that represents the current object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.istringable.tostring
     */
    ToString() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
