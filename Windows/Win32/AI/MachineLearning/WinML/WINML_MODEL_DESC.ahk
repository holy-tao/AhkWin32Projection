#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains description properties of the model.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_model_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_MODEL_DESC {
    #StructPack 8

    /**
     * The author of the model.
     */
    Author : PWSTR

    /**
     * The name of the model.
     */
    Name : PWSTR

    /**
     * The domain of the model.
     */
    Domain : PWSTR

    /**
     * The description of the model.
     */
    Description : PWSTR

    /**
     * The version of the model.
     */
    Version : IntPtr

}
