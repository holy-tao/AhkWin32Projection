#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\XamlBinaryWriterErrorInformation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Markup
 * @version WindowsRuntime 1.4
 */
class IXamlBinaryWriterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IXamlBinaryWriterStatics
     * @type {Guid}
     */
    static IID => Guid("{0d8ed07a-9b82-4aa8-b68b-026f2de1cc86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Write"]

    /**
     * This article helps you to configure the Script Task.
     * @param {IVector<IRandomAccessStream>} inputStreams 
     * @param {IVector<IRandomAccessStream>} outputStreams 
     * @param {IXamlMetadataProvider} xamlMetadataProvider 
     * @returns {XamlBinaryWriterErrorInformation} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/extending-packages-scripting-task-examples/write-event-log-script-task
     */
    Write(inputStreams, outputStreams, xamlMetadataProvider) {
        result_ := XamlBinaryWriterErrorInformation()
        result := ComCall(6, this, "ptr", inputStreams, "ptr", outputStreams, "ptr", xamlMetadataProvider, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
