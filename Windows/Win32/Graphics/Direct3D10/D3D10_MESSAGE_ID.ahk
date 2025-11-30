#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Debug messages for setting up an info-queue filter (see D3D10_INFO_QUEUE_FILTER); use these messages to allow or deny message categories to pass through the storage and retrieval filters.
 * @see https://docs.microsoft.com/windows/win32/api//d3d10sdklayers/ne-d3d10sdklayers-d3d10_message_id
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_MESSAGE_ID extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_UNKNOWN => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_HAZARD => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETINDEXBUFFER_HAZARD => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_VSSETSHADERRESOURCES_HAZARD => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_VSSETCONSTANTBUFFERS_HAZARD => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_GSSETSHADERRESOURCES_HAZARD => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_GSSETCONSTANTBUFFERS_HAZARD => 6

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_PSSETSHADERRESOURCES_HAZARD => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_PSSETCONSTANTBUFFERS_HAZARD => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_OMSETRENDERTARGETS_HAZARD => 9

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SOSETTARGETS_HAZARD => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_STRING_FROM_APPLICATION => 11

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_THIS => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER1 => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER2 => 14

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER3 => 15

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER4 => 16

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER5 => 17

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER6 => 18

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER7 => 19

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER8 => 20

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER9 => 21

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER10 => 22

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER11 => 23

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER12 => 24

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER13 => 25

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER14 => 26

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_PARAMETER15 => 27

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CORRUPTED_MULTITHREADING => 28

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_MESSAGE_REPORTING_OUTOFMEMORY => 29

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_IASETINPUTLAYOUT_UNBINDDELETINGOBJECT => 30

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_IASETVERTEXBUFFERS_UNBINDDELETINGOBJECT => 31

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_IASETINDEXBUFFER_UNBINDDELETINGOBJECT => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_VSSETSHADER_UNBINDDELETINGOBJECT => 33

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_VSSETSHADERRESOURCES_UNBINDDELETINGOBJECT => 34

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_VSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT => 35

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_VSSETSAMPLERS_UNBINDDELETINGOBJECT => 36

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_GSSETSHADER_UNBINDDELETINGOBJECT => 37

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_GSSETSHADERRESOURCES_UNBINDDELETINGOBJECT => 38

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_GSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT => 39

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_GSSETSAMPLERS_UNBINDDELETINGOBJECT => 40

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SOSETTARGETS_UNBINDDELETINGOBJECT => 41

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_PSSETSHADER_UNBINDDELETINGOBJECT => 42

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_PSSETSHADERRESOURCES_UNBINDDELETINGOBJECT => 43

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_PSSETCONSTANTBUFFERS_UNBINDDELETINGOBJECT => 44

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_PSSETSAMPLERS_UNBINDDELETINGOBJECT => 45

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_RSSETSTATE_UNBINDDELETINGOBJECT => 46

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_OMSETBLENDSTATE_UNBINDDELETINGOBJECT => 47

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_OMSETDEPTHSTENCILSTATE_UNBINDDELETINGOBJECT => 48

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_OMSETRENDERTARGETS_UNBINDDELETINGOBJECT => 49

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETPREDICATION_UNBINDDELETINGOBJECT => 50

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_GETPRIVATEDATA_MOREDATA => 51

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETPRIVATEDATA_INVALIDFREEDATA => 52

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETPRIVATEDATA_INVALIDIUNKNOWN => 53

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETPRIVATEDATA_INVALIDFLAGS => 54

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETPRIVATEDATA_CHANGINGPARAMS => 55

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETPRIVATEDATA_OUTOFMEMORY => 56

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDFORMAT => 57

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_INVALIDSAMPLES => 58

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDUSAGE => 59

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDBINDFLAGS => 60

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDCPUACCESSFLAGS => 61

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_UNRECOGNIZEDMISCFLAGS => 62

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_INVALIDCPUACCESSFLAGS => 63

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_INVALIDBINDFLAGS => 64

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_INVALIDINITIALDATA => 65

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_INVALIDDIMENSIONS => 66

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_INVALIDMIPLEVELS => 67

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_INVALIDMISCFLAGS => 68

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_INVALIDARG_RETURN => 69

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_OUTOFMEMORY_RETURN => 70

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_NULLDESC => 71

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_INVALIDCONSTANTBUFFERBINDINGS => 72

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBUFFER_LARGEALLOCATION => 73

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDFORMAT => 74

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_UNSUPPORTEDFORMAT => 75

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_INVALIDSAMPLES => 76

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDUSAGE => 77

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDBINDFLAGS => 78

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDCPUACCESSFLAGS => 79

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_UNRECOGNIZEDMISCFLAGS => 80

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_INVALIDCPUACCESSFLAGS => 81

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_INVALIDBINDFLAGS => 82

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_INVALIDINITIALDATA => 83

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_INVALIDDIMENSIONS => 84

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_INVALIDMIPLEVELS => 85

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_INVALIDMISCFLAGS => 86

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_INVALIDARG_RETURN => 87

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_OUTOFMEMORY_RETURN => 88

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_NULLDESC => 89

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE1D_LARGEALLOCATION => 90

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDFORMAT => 91

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_UNSUPPORTEDFORMAT => 92

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_INVALIDSAMPLES => 93

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDUSAGE => 94

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDBINDFLAGS => 95

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDCPUACCESSFLAGS => 96

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_UNRECOGNIZEDMISCFLAGS => 97

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_INVALIDCPUACCESSFLAGS => 98

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_INVALIDBINDFLAGS => 99

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_INVALIDINITIALDATA => 100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_INVALIDDIMENSIONS => 101

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_INVALIDMIPLEVELS => 102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_INVALIDMISCFLAGS => 103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_INVALIDARG_RETURN => 104

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_OUTOFMEMORY_RETURN => 105

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_NULLDESC => 106

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE2D_LARGEALLOCATION => 107

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDFORMAT => 108

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_UNSUPPORTEDFORMAT => 109

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_INVALIDSAMPLES => 110

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDUSAGE => 111

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDBINDFLAGS => 112

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDCPUACCESSFLAGS => 113

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_UNRECOGNIZEDMISCFLAGS => 114

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_INVALIDCPUACCESSFLAGS => 115

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_INVALIDBINDFLAGS => 116

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_INVALIDINITIALDATA => 117

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_INVALIDDIMENSIONS => 118

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_INVALIDMIPLEVELS => 119

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_INVALIDMISCFLAGS => 120

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_INVALIDARG_RETURN => 121

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_OUTOFMEMORY_RETURN => 122

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_NULLDESC => 123

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATETEXTURE3D_LARGEALLOCATION => 124

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_UNRECOGNIZEDFORMAT => 125

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDDESC => 126

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDFORMAT => 127

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDDIMENSIONS => 128

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDRESOURCE => 129

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_TOOMANYOBJECTS => 130

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_INVALIDARG_RETURN => 131

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_OUTOFMEMORY_RETURN => 132

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERENDERTARGETVIEW_UNRECOGNIZEDFORMAT => 133

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERENDERTARGETVIEW_UNSUPPORTEDFORMAT => 134

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDDESC => 135

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDFORMAT => 136

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDDIMENSIONS => 137

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDRESOURCE => 138

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERENDERTARGETVIEW_TOOMANYOBJECTS => 139

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERENDERTARGETVIEW_INVALIDARG_RETURN => 140

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERENDERTARGETVIEW_OUTOFMEMORY_RETURN => 141

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_UNRECOGNIZEDFORMAT => 142

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDDESC => 143

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDFORMAT => 144

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDDIMENSIONS => 145

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDRESOURCE => 146

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_TOOMANYOBJECTS => 147

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_INVALIDARG_RETURN => 148

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILVIEW_OUTOFMEMORY_RETURN => 149

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_OUTOFMEMORY => 150

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_TOOMANYELEMENTS => 151

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDFORMAT => 152

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_INCOMPATIBLEFORMAT => 153

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDSLOT => 154

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDINPUTSLOTCLASS => 155

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_STEPRATESLOTCLASSMISMATCH => 156

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDSLOTCLASSCHANGE => 157

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDSTEPRATECHANGE => 158

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_INVALIDALIGNMENT => 159

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_DUPLICATESEMANTIC => 160

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_UNPARSEABLEINPUTSIGNATURE => 161

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_NULLSEMANTIC => 162

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_MISSINGELEMENT => 163

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_NULLDESC => 164

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEVERTEXSHADER_OUTOFMEMORY => 165

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEVERTEXSHADER_INVALIDSHADERBYTECODE => 166

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEVERTEXSHADER_INVALIDSHADERTYPE => 167

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADER_OUTOFMEMORY => 168

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADER_INVALIDSHADERBYTECODE => 169

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADER_INVALIDSHADERTYPE => 170

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTOFMEMORY => 171

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERBYTECODE => 172

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSHADERTYPE => 173

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDNUMENTRIES => 174

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSTREAMSTRIDEUNUSED => 175

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_UNEXPECTEDDECL => 176

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_EXPECTEDDECL => 177

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_OUTPUTSLOT0EXPECTED => 178

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSLOT => 179

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_ONLYONEELEMENTPERSLOT => 180

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDCOMPONENTCOUNT => 181

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDSTARTCOMPONENTANDCOMPONENTCOUNT => 182

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDGAPDEFINITION => 183

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_REPEATEDOUTPUT => 184

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_INVALIDOUTPUTSTREAMSTRIDE => 185

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGSEMANTIC => 186

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MASKMISMATCH => 187

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_CANTHAVEONLYGAPS => 188

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_DECLTOOCOMPLEX => 189

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_MISSINGOUTPUTSIGNATURE => 190

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEPIXELSHADER_OUTOFMEMORY => 191

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEPIXELSHADER_INVALIDSHADERBYTECODE => 192

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEPIXELSHADER_INVALIDSHADERTYPE => 193

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDFILLMODE => 194

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDCULLMODE => 195

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDDEPTHBIASCLAMP => 196

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERASTERIZERSTATE_INVALIDSLOPESCALEDDEPTHBIAS => 197

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERASTERIZERSTATE_TOOMANYOBJECTS => 198

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERASTERIZERSTATE_NULLDESC => 199

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDDEPTHWRITEMASK => 200

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDDEPTHFUNC => 201

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFAILOP => 202

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILZFAILOP => 203

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILPASSOP => 204

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDFRONTFACESTENCILFUNC => 205

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFAILOP => 206

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILZFAILOP => 207

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILPASSOP => 208

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_INVALIDBACKFACESTENCILFUNC => 209

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_TOOMANYOBJECTS => 210

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_NULLDESC => 211

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_INVALIDSRCBLEND => 212

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_INVALIDDESTBLEND => 213

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_INVALIDBLENDOP => 214

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_INVALIDSRCBLENDALPHA => 215

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_INVALIDDESTBLENDALPHA => 216

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_INVALIDBLENDOPALPHA => 217

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_INVALIDRENDERTARGETWRITEMASK => 218

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_TOOMANYOBJECTS => 219

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_NULLDESC => 220

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDFILTER => 221

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDADDRESSU => 222

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDADDRESSV => 223

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDADDRESSW => 224

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDMIPLODBIAS => 225

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDMAXANISOTROPY => 226

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDCOMPARISONFUNC => 227

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDMINLOD => 228

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_INVALIDMAXLOD => 229

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_TOOMANYOBJECTS => 230

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_NULLDESC => 231

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEQUERYORPREDICATE_INVALIDQUERY => 232

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEQUERYORPREDICATE_INVALIDMISCFLAGS => 233

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEQUERYORPREDICATE_UNEXPECTEDMISCFLAG => 234

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEQUERYORPREDICATE_NULLDESC => 235

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETPRIMITIVETOPOLOGY_TOPOLOGY_UNRECOGNIZED => 236

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETPRIMITIVETOPOLOGY_TOPOLOGY_UNDEFINED => 237

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_IASETVERTEXBUFFERS_INVALIDBUFFER => 238

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_OFFSET_TOO_LARGE => 239

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_BUFFERS_EMPTY => 240

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_IASETINDEXBUFFER_INVALIDBUFFER => 241

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETINDEXBUFFER_FORMAT_INVALID => 242

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETINDEXBUFFER_OFFSET_TOO_LARGE => 243

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETINDEXBUFFER_OFFSET_UNALIGNED => 244

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_VSSETSHADERRESOURCES_VIEWS_EMPTY => 245

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_VSSETCONSTANTBUFFERS_INVALIDBUFFER => 246

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_VSSETCONSTANTBUFFERS_BUFFERS_EMPTY => 247

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_VSSETSAMPLERS_SAMPLERS_EMPTY => 248

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_GSSETSHADERRESOURCES_VIEWS_EMPTY => 249

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_GSSETCONSTANTBUFFERS_INVALIDBUFFER => 250

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_GSSETCONSTANTBUFFERS_BUFFERS_EMPTY => 251

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_GSSETSAMPLERS_SAMPLERS_EMPTY => 252

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SOSETTARGETS_INVALIDBUFFER => 253

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SOSETTARGETS_OFFSET_UNALIGNED => 254

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_PSSETSHADERRESOURCES_VIEWS_EMPTY => 255

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_PSSETCONSTANTBUFFERS_INVALIDBUFFER => 256

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_PSSETCONSTANTBUFFERS_BUFFERS_EMPTY => 257

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_PSSETSAMPLERS_SAMPLERS_EMPTY => 258

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RSSETVIEWPORTS_INVALIDVIEWPORT => 259

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RSSETSCISSORRECTS_INVALIDSCISSOR => 260

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CLEARRENDERTARGETVIEW_DENORMFLUSH => 261

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CLEARDEPTHSTENCILVIEW_DENORMFLUSH => 262

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CLEARDEPTHSTENCILVIEW_INVALID => 263

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IAGETVERTEXBUFFERS_BUFFERS_EMPTY => 264

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_VSGETSHADERRESOURCES_VIEWS_EMPTY => 265

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_VSGETCONSTANTBUFFERS_BUFFERS_EMPTY => 266

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_VSGETSAMPLERS_SAMPLERS_EMPTY => 267

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_GSGETSHADERRESOURCES_VIEWS_EMPTY => 268

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_GSGETCONSTANTBUFFERS_BUFFERS_EMPTY => 269

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_GSGETSAMPLERS_SAMPLERS_EMPTY => 270

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SOGETTARGETS_BUFFERS_EMPTY => 271

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_PSGETSHADERRESOURCES_VIEWS_EMPTY => 272

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_PSGETCONSTANTBUFFERS_BUFFERS_EMPTY => 273

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_PSGETSAMPLERS_SAMPLERS_EMPTY => 274

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RSGETVIEWPORTS_VIEWPORTS_EMPTY => 275

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RSGETSCISSORRECTS_RECTS_EMPTY => 276

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_GENERATEMIPS_RESOURCE_INVALID => 277

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDDESTINATIONSUBRESOURCE => 278

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDSOURCESUBRESOURCE => 279

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDSOURCEBOX => 280

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDSOURCE => 281

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDDESTINATIONSTATE => 282

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYSUBRESOURCEREGION_INVALIDSOURCESTATE => 283

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYRESOURCE_INVALIDSOURCE => 284

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYRESOURCE_INVALIDDESTINATIONSTATE => 285

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYRESOURCE_INVALIDSOURCESTATE => 286

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_UPDATESUBRESOURCE_INVALIDDESTINATIONSUBRESOURCE => 287

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_UPDATESUBRESOURCE_INVALIDDESTINATIONBOX => 288

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_UPDATESUBRESOURCE_INVALIDDESTINATIONSTATE => 289

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_DESTINATION_INVALID => 290

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_DESTINATION_SUBRESOURCE_INVALID => 291

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_SOURCE_INVALID => 292

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_SOURCE_SUBRESOURCE_INVALID => 293

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RESOLVESUBRESOURCE_FORMAT_INVALID => 294

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_BUFFER_MAP_INVALIDMAPTYPE => 295

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_BUFFER_MAP_INVALIDFLAGS => 296

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_BUFFER_MAP_ALREADYMAPPED => 297

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_BUFFER_MAP_DEVICEREMOVED_RETURN => 298

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_BUFFER_UNMAP_NOTMAPPED => 299

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE1D_MAP_INVALIDMAPTYPE => 300

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE1D_MAP_INVALIDSUBRESOURCE => 301

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE1D_MAP_INVALIDFLAGS => 302

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE1D_MAP_ALREADYMAPPED => 303

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE1D_MAP_DEVICEREMOVED_RETURN => 304

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE1D_UNMAP_INVALIDSUBRESOURCE => 305

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE1D_UNMAP_NOTMAPPED => 306

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE2D_MAP_INVALIDMAPTYPE => 307

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE2D_MAP_INVALIDSUBRESOURCE => 308

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE2D_MAP_INVALIDFLAGS => 309

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE2D_MAP_ALREADYMAPPED => 310

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE2D_MAP_DEVICEREMOVED_RETURN => 311

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE2D_UNMAP_INVALIDSUBRESOURCE => 312

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE2D_UNMAP_NOTMAPPED => 313

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE3D_MAP_INVALIDMAPTYPE => 314

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE3D_MAP_INVALIDSUBRESOURCE => 315

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE3D_MAP_INVALIDFLAGS => 316

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE3D_MAP_ALREADYMAPPED => 317

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE3D_MAP_DEVICEREMOVED_RETURN => 318

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE3D_UNMAP_INVALIDSUBRESOURCE => 319

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXTURE3D_UNMAP_NOTMAPPED => 320

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CHECKFORMATSUPPORT_FORMAT_DEPRECATED => 321

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CHECKMULTISAMPLEQUALITYLEVELS_FORMAT_DEPRECATED => 322

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETEXCEPTIONMODE_UNRECOGNIZEDFLAGS => 323

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETEXCEPTIONMODE_INVALIDARG_RETURN => 324

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETEXCEPTIONMODE_DEVICEREMOVED_RETURN => 325

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_REF_SIMULATING_INFINITELY_FAST_HARDWARE => 326

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_REF_THREADING_MODE => 327

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_REF_UMDRIVER_EXCEPTION => 328

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_REF_KMDRIVER_EXCEPTION => 329

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_REF_HARDWARE_EXCEPTION => 330

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_REF_ACCESSING_INDEXABLE_TEMP_OUT_OF_RANGE => 331

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_REF_PROBLEM_PARSING_SHADER => 332

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_REF_OUT_OF_MEMORY => 333

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_REF_INFO => 334

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_VERTEXPOS_OVERFLOW => 335

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAWINDEXED_INDEXPOS_OVERFLOW => 336

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAWINSTANCED_VERTEXPOS_OVERFLOW => 337

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAWINSTANCED_INSTANCEPOS_OVERFLOW => 338

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAWINDEXEDINSTANCED_INSTANCEPOS_OVERFLOW => 339

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAWINDEXEDINSTANCED_INDEXPOS_OVERFLOW => 340

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_VERTEX_SHADER_NOT_SET => 341

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SHADER_LINKAGE_SEMANTICNAME_NOT_FOUND => 342

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SHADER_LINKAGE_REGISTERINDEX => 343

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SHADER_LINKAGE_COMPONENTTYPE => 344

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SHADER_LINKAGE_REGISTERMASK => 345

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SHADER_LINKAGE_SYSTEMVALUE => 346

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SHADER_LINKAGE_NEVERWRITTEN_ALWAYSREADS => 347

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_VERTEX_BUFFER_NOT_SET => 348

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_INPUTLAYOUT_NOT_SET => 349

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_CONSTANT_BUFFER_NOT_SET => 350

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_CONSTANT_BUFFER_TOO_SMALL => 351

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_SAMPLER_NOT_SET => 352

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_SHADERRESOURCEVIEW_NOT_SET => 353

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_VIEW_DIMENSION_MISMATCH => 354

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_VERTEX_BUFFER_STRIDE_TOO_SMALL => 355

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_VERTEX_BUFFER_TOO_SMALL => 356

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_INDEX_BUFFER_NOT_SET => 357

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_INDEX_BUFFER_FORMAT_INVALID => 358

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_INDEX_BUFFER_TOO_SMALL => 359

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_GS_INPUT_PRIMITIVE_MISMATCH => 360

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_RESOURCE_RETURN_TYPE_MISMATCH => 361

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_POSITION_NOT_PRESENT => 362

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_OUTPUT_STREAM_NOT_SET => 363

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_BOUND_RESOURCE_MAPPED => 364

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_INVALID_PRIMITIVETOPOLOGY => 365

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_VERTEX_OFFSET_UNALIGNED => 366

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_VERTEX_STRIDE_UNALIGNED => 367

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_INDEX_OFFSET_UNALIGNED => 368

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_OUTPUT_STREAM_OFFSET_UNALIGNED => 369

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_RESOURCE_FORMAT_LD_UNSUPPORTED => 370

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_RESOURCE_FORMAT_SAMPLE_UNSUPPORTED => 371

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_RESOURCE_FORMAT_SAMPLE_C_UNSUPPORTED => 372

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_RESOURCE_MULTISAMPLE_UNSUPPORTED => 373

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_SO_TARGETS_BOUND_WITHOUT_SOURCE => 374

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_SO_STRIDE_LARGER_THAN_BUFFER => 375

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_OM_RENDER_TARGET_DOES_NOT_SUPPORT_BLENDING => 376

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_OM_DUAL_SOURCE_BLENDING_CAN_ONLY_HAVE_RENDER_TARGET_0 => 377

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_REMOVAL_PROCESS_AT_FAULT => 378

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_REMOVAL_PROCESS_POSSIBLY_AT_FAULT => 379

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_REMOVAL_PROCESS_NOT_AT_FAULT => 380

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_OPEN_SHARED_RESOURCE_INVALIDARG_RETURN => 381

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_OPEN_SHARED_RESOURCE_OUTOFMEMORY_RETURN => 382

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_OPEN_SHARED_RESOURCE_BADINTERFACE_RETURN => 383

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_VIEWPORT_NOT_SET => 384

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_TRAILING_DIGIT_IN_SEMANTIC => 385

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEGEOMETRYSHADERWITHSTREAMOUTPUT_TRAILING_DIGIT_IN_SEMANTIC => 386

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RSSETVIEWPORTS_DENORMFLUSH => 387

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_OMSETRENDERTARGETS_INVALIDVIEW => 388

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_SETTEXTFILTERSIZE_INVALIDDIMENSIONS => 389

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_SAMPLER_MISMATCH => 390

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_TYPE_MISMATCH => 391

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_BLENDSTATE_GETDESC_LEGACY => 392

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SHADERRESOURCEVIEW_GETDESC_LEGACY => 393

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEQUERY_OUTOFMEMORY_RETURN => 394

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEPREDICATE_OUTOFMEMORY_RETURN => 395

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATECOUNTER_OUTOFRANGE_COUNTER => 396

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATECOUNTER_SIMULTANEOUS_ACTIVE_COUNTERS_EXHAUSTED => 397

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATECOUNTER_UNSUPPORTED_WELLKNOWN_COUNTER => 398

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATECOUNTER_OUTOFMEMORY_RETURN => 399

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATECOUNTER_NONEXCLUSIVE_RETURN => 400

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATECOUNTER_NULLDESC => 401

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CHECKCOUNTER_OUTOFRANGE_COUNTER => 402

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CHECKCOUNTER_UNSUPPORTED_WELLKNOWN_COUNTER => 403

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETPREDICATION_INVALID_PREDICATE_STATE => 404

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_QUERY_BEGIN_UNSUPPORTED => 405

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_PREDICATE_BEGIN_DURING_PREDICATION => 406

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_QUERY_BEGIN_DUPLICATE => 407

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_QUERY_BEGIN_ABANDONING_PREVIOUS_RESULTS => 408

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_PREDICATE_END_DURING_PREDICATION => 409

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_QUERY_END_ABANDONING_PREVIOUS_RESULTS => 410

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_QUERY_END_WITHOUT_BEGIN => 411

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_QUERY_GETDATA_INVALID_DATASIZE => 412

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_QUERY_GETDATA_INVALID_FLAGS => 413

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_QUERY_GETDATA_INVALID_CALL => 414

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_PS_OUTPUT_TYPE_MISMATCH => 415

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_RESOURCE_FORMAT_GATHER_UNSUPPORTED => 416

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_INVALID_USE_OF_CENTER_MULTISAMPLE_PATTERN => 417

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_STRIDE_TOO_LARGE => 418

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETVERTEXBUFFERS_INVALIDRANGE => 419

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_EMPTY_LAYOUT => 420

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_DRAW_RESOURCE_SAMPLE_COUNT_MISMATCH => 421

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_OBJECT_SUMMARY => 422

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_BUFFER => 423

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_TEXTURE1D => 424

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_TEXTURE2D => 425

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_TEXTURE3D => 426

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_SHADERRESOURCEVIEW => 427

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_RENDERTARGETVIEW => 428

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_DEPTHSTENCILVIEW => 429

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_VERTEXSHADER => 430

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_GEOMETRYSHADER => 431

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_PIXELSHADER => 432

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_INPUTLAYOUT => 433

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_SAMPLER => 434

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_BLENDSTATE => 435

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_DEPTHSTENCILSTATE => 436

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_RASTERIZERSTATE => 437

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_QUERY => 438

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_PREDICATE => 439

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_COUNTER => 440

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_DEVICE => 441

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_LIVE_SWAPCHAIN => 442

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_D3D10_MESSAGES_END => 443

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_D3D10L9_MESSAGES_START => 1048576

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEDEPTHSTENCILSTATE_STENCIL_NO_TWO_SIDED => 1048577

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERASTERIZERSTATE_DepthBiasClamp_NOT_SUPPORTED => 1048578

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_NO_COMPARISON_SUPPORT => 1048579

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_EXCESSIVE_ANISOTROPY => 1048580

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_BORDER_OUT_OF_RANGE => 1048581

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_VSSETSAMPLERS_NOT_SUPPORTED => 1048582

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_VSSETSAMPLERS_TOO_MANY_SAMPLERS => 1048583

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_PSSETSAMPLERS_TOO_MANY_SAMPLERS => 1048584

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_NO_ARRAYS => 1048585

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_NO_VB_AND_IB_BIND => 1048586

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_NO_TEXTURE_1D => 1048587

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_DIMENSION_OUT_OF_RANGE => 1048588

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_NOT_BINDABLE_AS_SHADER_RESOURCE => 1048589

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_OMSETRENDERTARGETS_TOO_MANY_RENDER_TARGETS => 1048590

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_OMSETRENDERTARGETS_NO_DIFFERING_BIT_DEPTHS => 1048591

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_IASETVERTEXBUFFERS_BAD_BUFFER_INDEX => 1048592

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RSSETVIEWPORTS_TOO_MANY_VIEWPORTS => 1048593

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_IASETPRIMITIVETOPOLOGY_ADJACENCY_UNSUPPORTED => 1048594

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RSSETSCISSORRECTS_TOO_MANY_SCISSORS => 1048595

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYRESOURCE_ONLY_TEXTURE_2D_WITHIN_GPU_MEMORY => 1048596

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYRESOURCE_NO_TEXTURE_3D_READBACK => 1048597

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYRESOURCE_NO_TEXTURE_ONLY_READBACK => 1048598

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEINPUTLAYOUT_UNSUPPORTED_FORMAT => 1048599

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_NO_ALPHA_TO_COVERAGE => 1048600

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERASTERIZERSTATE_DepthClipEnable_MUST_BE_TRUE => 1048601

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DRAWINDEXED_STARTINDEXLOCATION_MUST_BE_POSITIVE => 1048602

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_MUST_USE_LOWEST_LOD => 1048603

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_MINLOD_MUST_NOT_BE_FRACTIONAL => 1048604

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_MAXLOD_MUST_BE_FLT_MAX => 1048605

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_FIRSTARRAYSLICE_MUST_BE_ZERO => 1048606

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESHADERRESOURCEVIEW_CUBES_MUST_HAVE_6_SIDES => 1048607

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_NOT_BINDABLE_AS_RENDER_TARGET => 1048608

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_NO_DWORD_INDEX_BUFFER => 1048609

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_MSAA_PRECLUDES_SHADER_RESOURCE => 1048610

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_PRESENTATION_PRECLUDES_SHADER_RESOURCE => 1048611

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_NO_INDEPENDENT_BLEND_ENABLE => 1048612

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_NO_INDEPENDENT_WRITE_MASKS => 1048613

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_NO_STREAM_OUT => 1048614

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_ONLY_VB_IB_FOR_BUFFERS => 1048615

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_NO_AUTOGEN_FOR_VOLUMES => 1048616

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_DXGI_FORMAT_R8G8B8A8_CANNOT_BE_SHARED => 1048617

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_VSSHADERRESOURCES_NOT_SUPPORTED => 1048618

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_GEOMETRY_SHADER_NOT_SUPPORTED => 1048619

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_STREAM_OUT_NOT_SUPPORTED => 1048620

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_TEXT_FILTER_NOT_SUPPORTED => 1048621

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_NO_SEPARATE_ALPHA_BLEND => 1048622

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_NO_MRT_BLEND => 1048623

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATEBLENDSTATE_OPERATION_NOT_SUPPORTED => 1048624

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_NO_MIRRORONCE => 1048625

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DRAWINSTANCED_NOT_SUPPORTED => 1048626

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DRAWINDEXEDINSTANCED_NOT_SUPPORTED_BELOW_9_3 => 1048627

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DRAWINDEXED_POINTLIST_UNSUPPORTED => 1048628

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SETBLENDSTATE_SAMPLE_MASK_CANNOT_BE_ZERO => 1048629

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_DIMENSION_EXCEEDS_FEATURE_LEVEL_DEFINITION => 1048630

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_ONLY_SINGLE_MIP_LEVEL_DEPTH_STENCIL_SUPPORTED => 1048631

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_DEVICE_RSSETSCISSORRECTS_NEGATIVESCISSOR => 1048632

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_SLOT_ZERO_MUST_BE_D3D10_INPUT_PER_VERTEX_DATA => 1048633

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATERESOURCE_NON_POW_2_MIPMAP => 1048634

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_CREATESAMPLERSTATE_BORDER_NOT_SUPPORTED => 1048635

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_OMSETRENDERTARGETS_NO_SRGB_MRT => 1048636

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_COPYRESOURCE_NO_3D_MISMATCHED_UPDATES => 1048637

    /**
     * 
     * @type {Integer (Int32)}
     */
    static D3D10_MESSAGE_ID_D3D10L9_MESSAGES_END => 1048638
}
