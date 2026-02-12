#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class IPlayReadyIndividualizationServiceRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPlayReadyIndividualizationServiceRequest
     * @type {Guid}
     */
    static IID => Guid("{21f5a86b-008c-4611-ab2f-aaa6c69f0e24}")

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
