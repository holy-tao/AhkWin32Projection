#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class IContainerEncodingProperties extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContainerEncodingProperties
     * @type {Guid}
     */
    static IID => Guid("{59ac2a57-b32a-479e-8a61-4b7f2e9e7ea0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
