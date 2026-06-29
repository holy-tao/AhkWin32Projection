#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINML_IMAGE_VARIABLE_DESC.ahk" { WINML_IMAGE_VARIABLE_DESC }
#Import ".\WINML_MAP_VARIABLE_DESC.ahk" { WINML_MAP_VARIABLE_DESC }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\WINML_FEATURE_TYPE.ahk" { WINML_FEATURE_TYPE }
#Import ".\WINML_TENSOR_VARIABLE_DESC.ahk" { WINML_TENSOR_VARIABLE_DESC }
#Import ".\WINML_TENSOR_DATA_TYPE.ahk" { WINML_TENSOR_DATA_TYPE }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\WINML_SEQUENCE_VARIABLE_DESC.ahk" { WINML_SEQUENCE_VARIABLE_DESC }

/**
 * Contains description properties of the variable.
 * @see https://learn.microsoft.com/windows/win32/api/winml/ns-winml-winml_variable_desc
 * @namespace Windows.Win32.AI.MachineLearning.WinML
 */
export default struct WINML_VARIABLE_DESC {
    #StructPack 8

    /**
     * The name of the variable.
     */
    Name : PWSTR

    /**
     * The description of the variable.
     */
    Description : PWSTR

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winml/ne-winml-winml_feature_type">WINML_FEATURE_TYPE</a> containing the feature type of variable.
     */
    FeatureType : WINML_FEATURE_TYPE

    /**
     * <b>true</b> if the variable is required; otherwise, <b>false</b>.
     */
    Required : BOOL

    Tensor : WINML_TENSOR_VARIABLE_DESC

    static __New() {
        DefineProp(this.Prototype, 'Sequence', { type: WINML_SEQUENCE_VARIABLE_DESC, offset: 24 })
        DefineProp(this.Prototype, 'Map', { type: WINML_MAP_VARIABLE_DESC, offset: 24 })
        DefineProp(this.Prototype, 'Image', { type: WINML_IMAGE_VARIABLE_DESC, offset: 24 })
        this.DeleteProp("__New")
    }
}
