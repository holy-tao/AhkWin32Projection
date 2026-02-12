#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Supports random access of data in input and output streams for a specified data format.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.storage.streams.irandomaccessstreamwithcontenttype
 * @namespace Windows.Storage.Streams
 * @version WindowsRuntime 1.4
 */
class IRandomAccessStreamWithContentType extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRandomAccessStreamWithContentType
     * @type {Guid}
     */
    static IID => Guid("{cc254827-4b3d-438f-9232-10c76bc7e038}")

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
