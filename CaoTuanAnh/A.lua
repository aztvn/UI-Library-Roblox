--[[
    ================================================================================
    Cao Tuan Anh - Script Hub UI Library (Roblox Luau Edition)
    Phiên bản: V1.0 Lite (Luxury Black-Gold Glassmorphism Theme)
    Tương thích 100% thay thế cho Luna UI:
        local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/.../UIScriptHub.lua"))()
    Logo chính: rbxassetid://80440647852304
    Thư viện Icons: Lucide Icons (Fluent UI)
    Tác giả: Cao Tuấn Anh Studio
    ================================================================================
--]]

local UIScriptHub = {}
UIScriptHub.__index = UIScriptHub

-- ================= SERVICES =================
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local HttpService = game:GetService("HttpService")

local LocalPlayer = Players.LocalPlayer

-- UI Parent an toàn cho mọi Executor
local TargetGuiParent
local successCore, _ = pcall(function()
    local test = CoreGui.Name
    TargetGuiParent = CoreGui
end)
if not successCore or not TargetGuiParent then
    TargetGuiParent = LocalPlayer:WaitForChild("PlayerGui")
end

-- ================= FULL LUCIDE ICONS (800+ ICONS TỪ FLUENT UI) =================
local Icons = {
    Logo         = "rbxassetid://80440647852304", -- Logo chính Cao Tuấn Anh
    Home         = "rbxassetid://10709791000",
    Terminal     = "rbxassetid://10734982144",
    Sliders      = "rbxassetid://10734963400",
    Palette      = "rbxassetid://10709791100",
    Settings     = "rbxassetid://10734950309",
    Play         = "rbxassetid://10734923549",
    Check        = "rbxassetid://10709790644",
    Close        = "rbxassetid://10747384394",
    Exit         = "rbxassetid://10723434906",
    External     = "rbxassetid://10723346684",
    Info         = "rbxassetid://10723415903",
    Bell         = "rbxassetid://10709775704",
    Copy         = "rbxassetid://10709812159",
    Minus        = "rbxassetid://10734896206",
    User         = "rbxassetid://10747373176",
    Key          = "rbxassetid://10723416652",
    Shield       = "rbxassetid://10734951847",
    ChevronRight = "rbxassetid://10709790387",
    ["lucide-accessibility"] = "rbxassetid://10709751939",
    ["lucide-activity"] = "rbxassetid://10709752035",
    ["lucide-air-vent"] = "rbxassetid://10709752131",
    ["lucide-airplay"] = "rbxassetid://10709752254",
    ["lucide-alarm-check"] = "rbxassetid://10709752405",
    ["lucide-alarm-clock"] = "rbxassetid://10709752630",
    ["lucide-alarm-clock-off"] = "rbxassetid://10709752508",
    ["lucide-alarm-minus"] = "rbxassetid://10709752732",
    ["lucide-alarm-plus"] = "rbxassetid://10709752825",
    ["lucide-album"] = "rbxassetid://10709752906",
    ["lucide-alert-circle"] = "rbxassetid://10709752996",
    ["lucide-alert-octagon"] = "rbxassetid://10709753064",
    ["lucide-alert-triangle"] = "rbxassetid://10709753149",
    ["lucide-align-center"] = "rbxassetid://10709753570",
    ["lucide-align-center-horizontal"] = "rbxassetid://10709753272",
    ["lucide-align-center-vertical"] = "rbxassetid://10709753421",
    ["lucide-align-end-horizontal"] = "rbxassetid://10709753692",
    ["lucide-align-end-vertical"] = "rbxassetid://10709753808",
    ["lucide-align-horizontal-distribute-center"] = "rbxassetid://10747779791",
    ["lucide-align-horizontal-distribute-end"] = "rbxassetid://10747784534",
    ["lucide-align-horizontal-distribute-start"] = "rbxassetid://10709754118",
    ["lucide-align-horizontal-justify-center"] = "rbxassetid://10709754204",
    ["lucide-align-horizontal-justify-end"] = "rbxassetid://10709754317",
    ["lucide-align-horizontal-justify-start"] = "rbxassetid://10709754436",
    ["lucide-align-horizontal-space-around"] = "rbxassetid://10709754590",
    ["lucide-align-horizontal-space-between"] = "rbxassetid://10709754749",
    ["lucide-align-justify"] = "rbxassetid://10709759610",
    ["lucide-align-left"] = "rbxassetid://10709759764",
    ["lucide-align-right"] = "rbxassetid://10709759895",
    ["lucide-align-start-horizontal"] = "rbxassetid://10709760051",
    ["lucide-align-start-vertical"] = "rbxassetid://10709760244",
    ["lucide-align-vertical-distribute-center"] = "rbxassetid://10709760351",
    ["lucide-align-vertical-distribute-end"] = "rbxassetid://10709760434",
    ["lucide-align-vertical-distribute-start"] = "rbxassetid://10709760612",
    ["lucide-align-vertical-justify-center"] = "rbxassetid://10709760814",
    ["lucide-align-vertical-justify-end"] = "rbxassetid://10709761003",
    ["lucide-align-vertical-justify-start"] = "rbxassetid://10709761176",
    ["lucide-align-vertical-space-around"] = "rbxassetid://10709761324",
    ["lucide-align-vertical-space-between"] = "rbxassetid://10709761434",
    ["lucide-anchor"] = "rbxassetid://10709761530",
    ["lucide-angry"] = "rbxassetid://10709761629",
    ["lucide-annoyed"] = "rbxassetid://10709761722",
    ["lucide-aperture"] = "rbxassetid://10709761813",
    ["lucide-apple"] = "rbxassetid://10709761889",
    ["lucide-archive"] = "rbxassetid://10709762233",
    ["lucide-archive-restore"] = "rbxassetid://10709762058",
    ["lucide-armchair"] = "rbxassetid://10709762327",
    ["lucide-arrow-big-down"] = "rbxassetid://10747796644",
    ["lucide-arrow-big-left"] = "rbxassetid://10709762574",
    ["lucide-arrow-big-right"] = "rbxassetid://10709762727",
    ["lucide-arrow-big-up"] = "rbxassetid://10709762879",
    ["lucide-arrow-down"] = "rbxassetid://10709767827",
    ["lucide-arrow-down-circle"] = "rbxassetid://10709763034",
    ["lucide-arrow-down-left"] = "rbxassetid://10709767656",
    ["lucide-arrow-down-right"] = "rbxassetid://10709767750",
    ["lucide-arrow-left"] = "rbxassetid://10709768114",
    ["lucide-arrow-left-circle"] = "rbxassetid://10709767936",
    ["lucide-arrow-left-right"] = "rbxassetid://10709768019",
    ["lucide-arrow-right"] = "rbxassetid://10709768347",
    ["lucide-arrow-right-circle"] = "rbxassetid://10709768226",
    ["lucide-arrow-up"] = "rbxassetid://10709768939",
    ["lucide-arrow-up-circle"] = "rbxassetid://10709768432",
    ["lucide-arrow-up-down"] = "rbxassetid://10709768538",
    ["lucide-arrow-up-left"] = "rbxassetid://10709768661",
    ["lucide-arrow-up-right"] = "rbxassetid://10709768787",
    ["lucide-asterisk"] = "rbxassetid://10709769095",
    ["lucide-at-sign"] = "rbxassetid://10709769286",
    ["lucide-award"] = "rbxassetid://10709769406",
    ["lucide-axe"] = "rbxassetid://10709769508",
    ["lucide-axis-3d"] = "rbxassetid://10709769598",
    ["lucide-baby"] = "rbxassetid://10709769732",
    ["lucide-backpack"] = "rbxassetid://10709769841",
    ["lucide-baggage-claim"] = "rbxassetid://10709769935",
    ["lucide-banana"] = "rbxassetid://10709770005",
    ["lucide-banknote"] = "rbxassetid://10709770178",
    ["lucide-bar-chart"] = "rbxassetid://10709773755",
    ["lucide-bar-chart-2"] = "rbxassetid://10709770317",
    ["lucide-bar-chart-3"] = "rbxassetid://10709770431",
    ["lucide-bar-chart-4"] = "rbxassetid://10709770560",
    ["lucide-bar-chart-horizontal"] = "rbxassetid://10709773669",
    ["lucide-barcode"] = "rbxassetid://10747360675",
    ["lucide-baseline"] = "rbxassetid://10709773863",
    ["lucide-bath"] = "rbxassetid://10709773963",
    ["lucide-battery"] = "rbxassetid://10709774640",
    ["lucide-battery-charging"] = "rbxassetid://10709774068",
    ["lucide-battery-full"] = "rbxassetid://10709774206",
    ["lucide-battery-low"] = "rbxassetid://10709774370",
    ["lucide-battery-medium"] = "rbxassetid://10709774513",
    ["lucide-beaker"] = "rbxassetid://10709774756",
    ["lucide-bed"] = "rbxassetid://10709775036",
    ["lucide-bed-double"] = "rbxassetid://10709774864",
    ["lucide-bed-single"] = "rbxassetid://10709774968",
    ["lucide-beer"] = "rbxassetid://10709775167",
    ["lucide-bell"] = "rbxassetid://10709775704",
    ["lucide-bell-minus"] = "rbxassetid://10709775241",
    ["lucide-bell-off"] = "rbxassetid://10709775320",
    ["lucide-bell-plus"] = "rbxassetid://10709775448",
    ["lucide-bell-ring"] = "rbxassetid://10709775560",
    ["lucide-bike"] = "rbxassetid://10709775894",
    ["lucide-binary"] = "rbxassetid://10709776050",
    ["lucide-bitcoin"] = "rbxassetid://10709776126",
    ["lucide-bluetooth"] = "rbxassetid://10709776655",
    ["lucide-bluetooth-connected"] = "rbxassetid://10709776240",
    ["lucide-bluetooth-off"] = "rbxassetid://10709776344",
    ["lucide-bluetooth-searching"] = "rbxassetid://10709776501",
    ["lucide-bold"] = "rbxassetid://10747813908",
    ["lucide-bomb"] = "rbxassetid://10709781460",
    ["lucide-bone"] = "rbxassetid://10709781605",
    ["lucide-book"] = "rbxassetid://10709781824",
    ["lucide-book-open"] = "rbxassetid://10709781717",
    ["lucide-bookmark"] = "rbxassetid://10709782154",
    ["lucide-bookmark-minus"] = "rbxassetid://10709781919",
    ["lucide-bookmark-plus"] = "rbxassetid://10709782044",
    ["lucide-bot"] = "rbxassetid://10709782230",
    ["lucide-box"] = "rbxassetid://10709782497",
    ["lucide-box-select"] = "rbxassetid://10709782342",
    ["lucide-boxes"] = "rbxassetid://10709782582",
    ["lucide-briefcase"] = "rbxassetid://10709782662",
    ["lucide-brush"] = "rbxassetid://10709782758",
    ["lucide-bug"] = "rbxassetid://10709782845",
    ["lucide-building"] = "rbxassetid://10709783051",
    ["lucide-building-2"] = "rbxassetid://10709782939",
    ["lucide-bus"] = "rbxassetid://10709783137",
    ["lucide-cake"] = "rbxassetid://10709783217",
    ["lucide-calculator"] = "rbxassetid://10709783311",
    ["lucide-calendar"] = "rbxassetid://10709789505",
    ["lucide-calendar-check"] = "rbxassetid://10709783474",
    ["lucide-calendar-check-2"] = "rbxassetid://10709783392",
    ["lucide-calendar-clock"] = "rbxassetid://10709783577",
    ["lucide-calendar-days"] = "rbxassetid://10709783673",
    ["lucide-calendar-heart"] = "rbxassetid://10709783835",
    ["lucide-calendar-minus"] = "rbxassetid://10709783959",
    ["lucide-calendar-off"] = "rbxassetid://10709788784",
    ["lucide-calendar-plus"] = "rbxassetid://10709788937",
    ["lucide-calendar-range"] = "rbxassetid://10709789053",
    ["lucide-calendar-search"] = "rbxassetid://10709789200",
    ["lucide-calendar-x"] = "rbxassetid://10709789407",
    ["lucide-calendar-x-2"] = "rbxassetid://10709789329",
    ["lucide-camera"] = "rbxassetid://10709789686",
    ["lucide-camera-off"] = "rbxassetid://10747822677",
    ["lucide-car"] = "rbxassetid://10709789810",
    ["lucide-carrot"] = "rbxassetid://10709789960",
    ["lucide-cast"] = "rbxassetid://10709790097",
    ["lucide-charge"] = "rbxassetid://10709790202",
    ["lucide-check"] = "rbxassetid://10709790644",
    ["lucide-check-circle"] = "rbxassetid://10709790387",
    ["lucide-check-circle-2"] = "rbxassetid://10709790298",
    ["lucide-check-square"] = "rbxassetid://10709790537",
    ["lucide-chef-hat"] = "rbxassetid://10709790757",
    ["lucide-cherry"] = "rbxassetid://10709790875",
    ["lucide-chevron-down"] = "rbxassetid://10709790948",
    ["lucide-chevron-first"] = "rbxassetid://10709791015",
    ["lucide-chevron-last"] = "rbxassetid://10709791130",
    ["lucide-chevron-left"] = "rbxassetid://10709791281",
    ["lucide-chevron-right"] = "rbxassetid://10709791437",
    ["lucide-chevron-up"] = "rbxassetid://10709791523",
    ["lucide-chevrons-down"] = "rbxassetid://10709796864",
    ["lucide-chevrons-down-up"] = "rbxassetid://10709791632",
    ["lucide-chevrons-left"] = "rbxassetid://10709797151",
    ["lucide-chevrons-left-right"] = "rbxassetid://10709797006",
    ["lucide-chevrons-right"] = "rbxassetid://10709797382",
    ["lucide-chevrons-right-left"] = "rbxassetid://10709797274",
    ["lucide-chevrons-up"] = "rbxassetid://10709797622",
    ["lucide-chevrons-up-down"] = "rbxassetid://10709797508",
    ["lucide-chrome"] = "rbxassetid://10709797725",
    ["lucide-circle"] = "rbxassetid://10709798174",
    ["lucide-circle-dot"] = "rbxassetid://10709797837",
    ["lucide-circle-ellipsis"] = "rbxassetid://10709797985",
    ["lucide-circle-slashed"] = "rbxassetid://10709798100",
    ["lucide-citrus"] = "rbxassetid://10709798276",
    ["lucide-clapperboard"] = "rbxassetid://10709798350",
    ["lucide-clipboard"] = "rbxassetid://10709799288",
    ["lucide-clipboard-check"] = "rbxassetid://10709798443",
    ["lucide-clipboard-copy"] = "rbxassetid://10709798574",
    ["lucide-clipboard-edit"] = "rbxassetid://10709798682",
    ["lucide-clipboard-list"] = "rbxassetid://10709798792",
    ["lucide-clipboard-signature"] = "rbxassetid://10709798890",
    ["lucide-clipboard-type"] = "rbxassetid://10709798999",
    ["lucide-clipboard-x"] = "rbxassetid://10709799124",
    ["lucide-clock"] = "rbxassetid://10709805144",
    ["lucide-clock-1"] = "rbxassetid://10709799535",
    ["lucide-clock-10"] = "rbxassetid://10709799718",
    ["lucide-clock-11"] = "rbxassetid://10709799818",
    ["lucide-clock-12"] = "rbxassetid://10709799962",
    ["lucide-clock-2"] = "rbxassetid://10709803876",
    ["lucide-clock-3"] = "rbxassetid://10709803989",
    ["lucide-clock-4"] = "rbxassetid://10709804164",
    ["lucide-clock-5"] = "rbxassetid://10709804291",
    ["lucide-clock-6"] = "rbxassetid://10709804435",
    ["lucide-clock-7"] = "rbxassetid://10709804599",
    ["lucide-clock-8"] = "rbxassetid://10709804784",
    ["lucide-clock-9"] = "rbxassetid://10709804996",
    ["lucide-cloud"] = "rbxassetid://10709806740",
    ["lucide-cloud-cog"] = "rbxassetid://10709805262",
    ["lucide-cloud-drizzle"] = "rbxassetid://10709805371",
    ["lucide-cloud-fog"] = "rbxassetid://10709805477",
    ["lucide-cloud-hail"] = "rbxassetid://10709805596",
    ["lucide-cloud-lightning"] = "rbxassetid://10709805727",
    ["lucide-cloud-moon"] = "rbxassetid://10709805942",
    ["lucide-cloud-moon-rain"] = "rbxassetid://10709805838",
    ["lucide-cloud-off"] = "rbxassetid://10709806060",
    ["lucide-cloud-rain"] = "rbxassetid://10709806277",
    ["lucide-cloud-rain-wind"] = "rbxassetid://10709806166",
    ["lucide-cloud-snow"] = "rbxassetid://10709806374",
    ["lucide-cloud-sun"] = "rbxassetid://10709806631",
    ["lucide-cloud-sun-rain"] = "rbxassetid://10709806475",
    ["lucide-cloudy"] = "rbxassetid://10709806859",
    ["lucide-clover"] = "rbxassetid://10709806995",
    ["lucide-code"] = "rbxassetid://10709810463",
    ["lucide-code-2"] = "rbxassetid://10709807111",
    ["lucide-codepen"] = "rbxassetid://10709810534",
    ["lucide-codesandbox"] = "rbxassetid://10709810676",
    ["lucide-coffee"] = "rbxassetid://10709810814",
    ["lucide-cog"] = "rbxassetid://10709810948",
    ["lucide-coins"] = "rbxassetid://10709811110",
    ["lucide-columns"] = "rbxassetid://10709811261",
    ["lucide-command"] = "rbxassetid://10709811365",
    ["lucide-compass"] = "rbxassetid://10709811445",
    ["lucide-component"] = "rbxassetid://10709811595",
    ["lucide-concierge-bell"] = "rbxassetid://10709811706",
    ["lucide-connection"] = "rbxassetid://10747361219",
    ["lucide-contact"] = "rbxassetid://10709811834",
    ["lucide-contrast"] = "rbxassetid://10709811939",
    ["lucide-cookie"] = "rbxassetid://10709812067",
    ["lucide-copy"] = "rbxassetid://10709812159",
    ["lucide-copyleft"] = "rbxassetid://10709812251",
    ["lucide-copyright"] = "rbxassetid://10709812311",
    ["lucide-corner-down-left"] = "rbxassetid://10709812396",
    ["lucide-corner-down-right"] = "rbxassetid://10709812485",
    ["lucide-corner-left-down"] = "rbxassetid://10709812632",
    ["lucide-corner-left-up"] = "rbxassetid://10709812784",
    ["lucide-corner-right-down"] = "rbxassetid://10709812939",
    ["lucide-corner-right-up"] = "rbxassetid://10709813094",
    ["lucide-corner-up-left"] = "rbxassetid://10709813185",
    ["lucide-corner-up-right"] = "rbxassetid://10709813281",
    ["lucide-cpu"] = "rbxassetid://10709813383",
    ["lucide-croissant"] = "rbxassetid://10709818125",
    ["lucide-crop"] = "rbxassetid://10709818245",
    ["lucide-cross"] = "rbxassetid://10709818399",
    ["lucide-crosshair"] = "rbxassetid://10709818534",
    ["lucide-crown"] = "rbxassetid://10709818626",
    ["lucide-cup-soda"] = "rbxassetid://10709818763",
    ["lucide-curly-braces"] = "rbxassetid://10709818847",
    ["lucide-currency"] = "rbxassetid://10709818931",
    ["lucide-database"] = "rbxassetid://10709818996",
    ["lucide-delete"] = "rbxassetid://10709819059",
    ["lucide-diamond"] = "rbxassetid://10709819149",
    ["lucide-dice-1"] = "rbxassetid://10709819266",
    ["lucide-dice-2"] = "rbxassetid://10709819361",
    ["lucide-dice-3"] = "rbxassetid://10709819508",
    ["lucide-dice-4"] = "rbxassetid://10709819670",
    ["lucide-dice-5"] = "rbxassetid://10709819801",
    ["lucide-dice-6"] = "rbxassetid://10709819896",
    ["lucide-dices"] = "rbxassetid://10723343321",
    ["lucide-diff"] = "rbxassetid://10723343416",
    ["lucide-disc"] = "rbxassetid://10723343537",
    ["lucide-divide"] = "rbxassetid://10723343805",
    ["lucide-divide-circle"] = "rbxassetid://10723343636",
    ["lucide-divide-square"] = "rbxassetid://10723343737",
    ["lucide-dollar-sign"] = "rbxassetid://10723343958",
    ["lucide-download"] = "rbxassetid://10723344270",
    ["lucide-download-cloud"] = "rbxassetid://10723344088",
    ["lucide-droplet"] = "rbxassetid://10723344432",
    ["lucide-droplets"] = "rbxassetid://10734883356",
    ["lucide-drumstick"] = "rbxassetid://10723344737",
    ["lucide-edit"] = "rbxassetid://10734883598",
    ["lucide-edit-2"] = "rbxassetid://10723344885",
    ["lucide-edit-3"] = "rbxassetid://10723345088",
    ["lucide-egg"] = "rbxassetid://10723345518",
    ["lucide-egg-fried"] = "rbxassetid://10723345347",
    ["lucide-electricity"] = "rbxassetid://10723345749",
    ["lucide-electricity-off"] = "rbxassetid://10723345643",
    ["lucide-equal"] = "rbxassetid://10723345990",
    ["lucide-equal-not"] = "rbxassetid://10723345866",
    ["lucide-eraser"] = "rbxassetid://10723346158",
    ["lucide-euro"] = "rbxassetid://10723346372",
    ["lucide-expand"] = "rbxassetid://10723346553",
    ["lucide-external-link"] = "rbxassetid://10723346684",
    ["lucide-eye"] = "rbxassetid://10723346959",
    ["lucide-eye-off"] = "rbxassetid://10723346871",
    ["lucide-factory"] = "rbxassetid://10723347051",
    ["lucide-fan"] = "rbxassetid://10723354359",
    ["lucide-fast-forward"] = "rbxassetid://10723354521",
    ["lucide-feather"] = "rbxassetid://10723354671",
    ["lucide-figma"] = "rbxassetid://10723354801",
    ["lucide-file"] = "rbxassetid://10723374641",
    ["lucide-file-archive"] = "rbxassetid://10723354921",
    ["lucide-file-audio"] = "rbxassetid://10723355148",
    ["lucide-file-audio-2"] = "rbxassetid://10723355026",
    ["lucide-file-axis-3d"] = "rbxassetid://10723355272",
    ["lucide-file-badge"] = "rbxassetid://10723355622",
    ["lucide-file-badge-2"] = "rbxassetid://10723355451",
    ["lucide-file-bar-chart"] = "rbxassetid://10723355887",
    ["lucide-file-bar-chart-2"] = "rbxassetid://10723355746",
    ["lucide-file-box"] = "rbxassetid://10723355989",
    ["lucide-file-check"] = "rbxassetid://10723356210",
    ["lucide-file-check-2"] = "rbxassetid://10723356100",
    ["lucide-file-clock"] = "rbxassetid://10723356329",
    ["lucide-file-code"] = "rbxassetid://10723356507",
    ["lucide-file-cog"] = "rbxassetid://10723356830",
    ["lucide-file-cog-2"] = "rbxassetid://10723356676",
    ["lucide-file-diff"] = "rbxassetid://10723357039",
    ["lucide-file-digit"] = "rbxassetid://10723357151",
    ["lucide-file-down"] = "rbxassetid://10723357322",
    ["lucide-file-edit"] = "rbxassetid://10723357495",
    ["lucide-file-heart"] = "rbxassetid://10723357637",
    ["lucide-file-image"] = "rbxassetid://10723357790",
    ["lucide-file-input"] = "rbxassetid://10723357933",
    ["lucide-file-json"] = "rbxassetid://10723364435",
    ["lucide-file-json-2"] = "rbxassetid://10723364361",
    ["lucide-file-key"] = "rbxassetid://10723364605",
    ["lucide-file-key-2"] = "rbxassetid://10723364515",
    ["lucide-file-line-chart"] = "rbxassetid://10723364725",
    ["lucide-file-lock"] = "rbxassetid://10723364957",
    ["lucide-file-lock-2"] = "rbxassetid://10723364861",
    ["lucide-file-minus"] = "rbxassetid://10723365254",
    ["lucide-file-minus-2"] = "rbxassetid://10723365086",
    ["lucide-file-output"] = "rbxassetid://10723365457",
    ["lucide-file-pie-chart"] = "rbxassetid://10723365598",
    ["lucide-file-plus"] = "rbxassetid://10723365877",
    ["lucide-file-plus-2"] = "rbxassetid://10723365766",
    ["lucide-file-question"] = "rbxassetid://10723365987",
    ["lucide-file-scan"] = "rbxassetid://10723366167",
    ["lucide-file-search"] = "rbxassetid://10723366550",
    ["lucide-file-search-2"] = "rbxassetid://10723366340",
    ["lucide-file-signature"] = "rbxassetid://10723366741",
    ["lucide-file-spreadsheet"] = "rbxassetid://10723366962",
    ["lucide-file-symlink"] = "rbxassetid://10723367098",
    ["lucide-file-terminal"] = "rbxassetid://10723367244",
    ["lucide-file-text"] = "rbxassetid://10723367380",
    ["lucide-file-type"] = "rbxassetid://10723367606",
    ["lucide-file-type-2"] = "rbxassetid://10723367509",
    ["lucide-file-up"] = "rbxassetid://10723367734",
    ["lucide-file-video"] = "rbxassetid://10723373884",
    ["lucide-file-video-2"] = "rbxassetid://10723367834",
    ["lucide-file-volume"] = "rbxassetid://10723374172",
    ["lucide-file-volume-2"] = "rbxassetid://10723374030",
    ["lucide-file-warning"] = "rbxassetid://10723374276",
    ["lucide-file-x"] = "rbxassetid://10723374544",
    ["lucide-file-x-2"] = "rbxassetid://10723374378",
    ["lucide-files"] = "rbxassetid://10723374759",
    ["lucide-film"] = "rbxassetid://10723374981",
    ["lucide-filter"] = "rbxassetid://10723375128",
    ["lucide-fingerprint"] = "rbxassetid://10723375250",
    ["lucide-flag"] = "rbxassetid://10723375890",
    ["lucide-flag-off"] = "rbxassetid://10723375443",
    ["lucide-flag-triangle-left"] = "rbxassetid://10723375608",
    ["lucide-flag-triangle-right"] = "rbxassetid://10723375727",
    ["lucide-flame"] = "rbxassetid://10723376114",
    ["lucide-flashlight"] = "rbxassetid://10723376471",
    ["lucide-flashlight-off"] = "rbxassetid://10723376365",
    ["lucide-flask-conical"] = "rbxassetid://10734883986",
    ["lucide-flask-round"] = "rbxassetid://10723376614",
    ["lucide-flip-horizontal"] = "rbxassetid://10723376884",
    ["lucide-flip-horizontal-2"] = "rbxassetid://10723376745",
    ["lucide-flip-vertical"] = "rbxassetid://10723377138",
    ["lucide-flip-vertical-2"] = "rbxassetid://10723377026",
    ["lucide-flower"] = "rbxassetid://10747830374",
    ["lucide-flower-2"] = "rbxassetid://10723377305",
    ["lucide-focus"] = "rbxassetid://10723377537",
    ["lucide-folder"] = "rbxassetid://10723387563",
    ["lucide-folder-archive"] = "rbxassetid://10723384478",
    ["lucide-folder-check"] = "rbxassetid://10723384605",
    ["lucide-folder-clock"] = "rbxassetid://10723384731",
    ["lucide-folder-closed"] = "rbxassetid://10723384893",
    ["lucide-folder-cog"] = "rbxassetid://10723385213",
    ["lucide-folder-cog-2"] = "rbxassetid://10723385036",
    ["lucide-folder-down"] = "rbxassetid://10723385338",
    ["lucide-folder-edit"] = "rbxassetid://10723385445",
    ["lucide-folder-heart"] = "rbxassetid://10723385545",
    ["lucide-folder-input"] = "rbxassetid://10723385721",
    ["lucide-folder-key"] = "rbxassetid://10723385848",
    ["lucide-folder-lock"] = "rbxassetid://10723386005",
    ["lucide-folder-minus"] = "rbxassetid://10723386127",
    ["lucide-folder-open"] = "rbxassetid://10723386277",
    ["lucide-folder-output"] = "rbxassetid://10723386386",
    ["lucide-folder-plus"] = "rbxassetid://10723386531",
    ["lucide-folder-search"] = "rbxassetid://10723386787",
    ["lucide-folder-search-2"] = "rbxassetid://10723386674",
    ["lucide-folder-symlink"] = "rbxassetid://10723386930",
    ["lucide-folder-tree"] = "rbxassetid://10723387085",
    ["lucide-folder-up"] = "rbxassetid://10723387265",
    ["lucide-folder-x"] = "rbxassetid://10723387448",
    ["lucide-folders"] = "rbxassetid://10723387721",
    ["lucide-form-input"] = "rbxassetid://10723387841",
    ["lucide-forward"] = "rbxassetid://10723388016",
    ["lucide-frame"] = "rbxassetid://10723394389",
    ["lucide-framer"] = "rbxassetid://10723394565",
    ["lucide-frown"] = "rbxassetid://10723394681",
    ["lucide-fuel"] = "rbxassetid://10723394846",
    ["lucide-function-square"] = "rbxassetid://10723395041",
    ["lucide-gamepad"] = "rbxassetid://10723395457",
    ["lucide-gamepad-2"] = "rbxassetid://10723395215",
    ["lucide-gauge"] = "rbxassetid://10723395708",
    ["lucide-gavel"] = "rbxassetid://10723395896",
    ["lucide-gem"] = "rbxassetid://10723396000",
    ["lucide-ghost"] = "rbxassetid://10723396107",
    ["lucide-gift"] = "rbxassetid://10723396402",
    ["lucide-gift-card"] = "rbxassetid://10723396225",
    ["lucide-git-branch"] = "rbxassetid://10723396676",
    ["lucide-git-branch-plus"] = "rbxassetid://10723396542",
    ["lucide-git-commit"] = "rbxassetid://10723396812",
    ["lucide-git-compare"] = "rbxassetid://10723396954",
    ["lucide-git-fork"] = "rbxassetid://10723397049",
    ["lucide-git-merge"] = "rbxassetid://10723397165",
    ["lucide-git-pull-request"] = "rbxassetid://10723397431",
    ["lucide-git-pull-request-closed"] = "rbxassetid://10723397268",
    ["lucide-git-pull-request-draft"] = "rbxassetid://10734884302",
    ["lucide-glass"] = "rbxassetid://10723397788",
    ["lucide-glass-2"] = "rbxassetid://10723397529",
    ["lucide-glass-water"] = "rbxassetid://10723397678",
    ["lucide-glasses"] = "rbxassetid://10723397895",
    ["lucide-globe"] = "rbxassetid://10723404337",
    ["lucide-globe-2"] = "rbxassetid://10723398002",
    ["lucide-grab"] = "rbxassetid://10723404472",
    ["lucide-graduation-cap"] = "rbxassetid://10723404691",
    ["lucide-grape"] = "rbxassetid://10723404822",
    ["lucide-grid"] = "rbxassetid://10723404936",
    ["lucide-grip-horizontal"] = "rbxassetid://10723405089",
    ["lucide-grip-vertical"] = "rbxassetid://10723405236",
    ["lucide-hammer"] = "rbxassetid://10723405360",
    ["lucide-hand"] = "rbxassetid://10723405649",
    ["lucide-hand-metal"] = "rbxassetid://10723405508",
    ["lucide-hard-drive"] = "rbxassetid://10723405749",
    ["lucide-hard-hat"] = "rbxassetid://10723405859",
    ["lucide-hash"] = "rbxassetid://10723405975",
    ["lucide-haze"] = "rbxassetid://10723406078",
    ["lucide-headphones"] = "rbxassetid://10723406165",
    ["lucide-heart"] = "rbxassetid://10723406885",
    ["lucide-heart-crack"] = "rbxassetid://10723406299",
    ["lucide-heart-handshake"] = "rbxassetid://10723406480",
    ["lucide-heart-off"] = "rbxassetid://10723406662",
    ["lucide-heart-pulse"] = "rbxassetid://10723406795",
    ["lucide-help-circle"] = "rbxassetid://10723406988",
    ["lucide-hexagon"] = "rbxassetid://10723407092",
    ["lucide-highlighter"] = "rbxassetid://10723407192",
    ["lucide-history"] = "rbxassetid://10723407335",
    ["lucide-home"] = "rbxassetid://10723407389",
    ["lucide-hourglass"] = "rbxassetid://10723407498",
    ["lucide-ice-cream"] = "rbxassetid://10723414308",
    ["lucide-image"] = "rbxassetid://10723415040",
    ["lucide-image-minus"] = "rbxassetid://10723414487",
    ["lucide-image-off"] = "rbxassetid://10723414677",
    ["lucide-image-plus"] = "rbxassetid://10723414827",
    ["lucide-import"] = "rbxassetid://10723415205",
    ["lucide-inbox"] = "rbxassetid://10723415335",
    ["lucide-indent"] = "rbxassetid://10723415494",
    ["lucide-indian-rupee"] = "rbxassetid://10723415642",
    ["lucide-infinity"] = "rbxassetid://10723415766",
    ["lucide-info"] = "rbxassetid://10723415903",
    ["lucide-inspect"] = "rbxassetid://10723416057",
    ["lucide-italic"] = "rbxassetid://10723416195",
    ["lucide-japanese-yen"] = "rbxassetid://10723416363",
    ["lucide-joystick"] = "rbxassetid://10723416527",
    ["lucide-key"] = "rbxassetid://10723416652",
    ["lucide-keyboard"] = "rbxassetid://10723416765",
    ["lucide-lamp"] = "rbxassetid://10723417513",
    ["lucide-lamp-ceiling"] = "rbxassetid://10723416922",
    ["lucide-lamp-desk"] = "rbxassetid://10723417016",
    ["lucide-lamp-floor"] = "rbxassetid://10723417131",
    ["lucide-lamp-wall-down"] = "rbxassetid://10723417240",
    ["lucide-lamp-wall-up"] = "rbxassetid://10723417356",
    ["lucide-landmark"] = "rbxassetid://10723417608",
    ["lucide-languages"] = "rbxassetid://10723417703",
    ["lucide-laptop"] = "rbxassetid://10723423881",
    ["lucide-laptop-2"] = "rbxassetid://10723417797",
    ["lucide-lasso"] = "rbxassetid://10723424235",
    ["lucide-lasso-select"] = "rbxassetid://10723424058",
    ["lucide-laugh"] = "rbxassetid://10723424372",
    ["lucide-layers"] = "rbxassetid://10723424505",
    ["lucide-layout"] = "rbxassetid://10723425376",
    ["lucide-layout-dashboard"] = "rbxassetid://10723424646",
    ["lucide-layout-grid"] = "rbxassetid://10723424838",
    ["lucide-layout-list"] = "rbxassetid://10723424963",
    ["lucide-layout-template"] = "rbxassetid://10723425187",
    ["lucide-leaf"] = "rbxassetid://10723425539",
    ["lucide-library"] = "rbxassetid://10723425615",
    ["lucide-life-buoy"] = "rbxassetid://10723425685",
    ["lucide-lightbulb"] = "rbxassetid://10723425852",
    ["lucide-lightbulb-off"] = "rbxassetid://10723425762",
    ["lucide-line-chart"] = "rbxassetid://10723426393",
    ["lucide-link"] = "rbxassetid://10723426722",
    ["lucide-link-2"] = "rbxassetid://10723426595",
    ["lucide-link-2-off"] = "rbxassetid://10723426513",
    ["lucide-list"] = "rbxassetid://10723433811",
    ["lucide-list-checks"] = "rbxassetid://10734884548",
    ["lucide-list-end"] = "rbxassetid://10723426886",
    ["lucide-list-minus"] = "rbxassetid://10723426986",
    ["lucide-list-music"] = "rbxassetid://10723427081",
    ["lucide-list-ordered"] = "rbxassetid://10723427199",
    ["lucide-list-plus"] = "rbxassetid://10723427334",
    ["lucide-list-start"] = "rbxassetid://10723427494",
    ["lucide-list-video"] = "rbxassetid://10723427619",
    ["lucide-list-x"] = "rbxassetid://10723433655",
    ["lucide-loader"] = "rbxassetid://10723434070",
    ["lucide-loader-2"] = "rbxassetid://10723433935",
    ["lucide-locate"] = "rbxassetid://10723434557",
    ["lucide-locate-fixed"] = "rbxassetid://10723434236",
    ["lucide-locate-off"] = "rbxassetid://10723434379",
    ["lucide-lock"] = "rbxassetid://10723434711",
    ["lucide-log-in"] = "rbxassetid://10723434830",
    ["lucide-log-out"] = "rbxassetid://10723434906",
    ["lucide-luggage"] = "rbxassetid://10723434993",
    ["lucide-magnet"] = "rbxassetid://10723435069",
    ["lucide-mail"] = "rbxassetid://10734885430",
    ["lucide-mail-check"] = "rbxassetid://10723435182",
    ["lucide-mail-minus"] = "rbxassetid://10723435261",
    ["lucide-mail-open"] = "rbxassetid://10723435342",
    ["lucide-mail-plus"] = "rbxassetid://10723435443",
    ["lucide-mail-question"] = "rbxassetid://10723435515",
    ["lucide-mail-search"] = "rbxassetid://10734884739",
    ["lucide-mail-warning"] = "rbxassetid://10734885015",
    ["lucide-mail-x"] = "rbxassetid://10734885247",
    ["lucide-mails"] = "rbxassetid://10734885614",
    ["lucide-map"] = "rbxassetid://10734886202",
    ["lucide-map-pin"] = "rbxassetid://10734886004",
    ["lucide-map-pin-off"] = "rbxassetid://10734885803",
    ["lucide-maximize"] = "rbxassetid://10734886735",
    ["lucide-maximize-2"] = "rbxassetid://10734886496",
    ["lucide-medal"] = "rbxassetid://10734887072",
    ["lucide-megaphone"] = "rbxassetid://10734887454",
    ["lucide-megaphone-off"] = "rbxassetid://10734887311",
    ["lucide-meh"] = "rbxassetid://10734887603",
    ["lucide-menu"] = "rbxassetid://10734887784",
    ["lucide-message-circle"] = "rbxassetid://10734888000",
    ["lucide-message-square"] = "rbxassetid://10734888228",
    ["lucide-mic"] = "rbxassetid://10734888864",
    ["lucide-mic-2"] = "rbxassetid://10734888430",
    ["lucide-mic-off"] = "rbxassetid://10734888646",
    ["lucide-microscope"] = "rbxassetid://10734889106",
    ["lucide-microwave"] = "rbxassetid://10734895076",
    ["lucide-milestone"] = "rbxassetid://10734895310",
    ["lucide-minimize"] = "rbxassetid://10734895698",
    ["lucide-minimize-2"] = "rbxassetid://10734895530",
    ["lucide-minus"] = "rbxassetid://10734896206",
    ["lucide-minus-circle"] = "rbxassetid://10734895856",
    ["lucide-minus-square"] = "rbxassetid://10734896029",
    ["lucide-monitor"] = "rbxassetid://10734896881",
    ["lucide-monitor-off"] = "rbxassetid://10734896360",
    ["lucide-monitor-speaker"] = "rbxassetid://10734896512",
    ["lucide-moon"] = "rbxassetid://10734897102",
    ["lucide-more-horizontal"] = "rbxassetid://10734897250",
    ["lucide-more-vertical"] = "rbxassetid://10734897387",
    ["lucide-mountain"] = "rbxassetid://10734897956",
    ["lucide-mountain-snow"] = "rbxassetid://10734897665",
    ["lucide-mouse"] = "rbxassetid://10734898592",
    ["lucide-mouse-pointer"] = "rbxassetid://10734898476",
    ["lucide-mouse-pointer-2"] = "rbxassetid://10734898194",
    ["lucide-mouse-pointer-click"] = "rbxassetid://10734898355",
    ["lucide-move"] = "rbxassetid://10734900011",
    ["lucide-move-3d"] = "rbxassetid://10734898756",
    ["lucide-move-diagonal"] = "rbxassetid://10734899164",
    ["lucide-move-diagonal-2"] = "rbxassetid://10734898934",
    ["lucide-move-horizontal"] = "rbxassetid://10734899414",
    ["lucide-move-vertical"] = "rbxassetid://10734899821",
    ["lucide-music"] = "rbxassetid://10734905958",
    ["lucide-music-2"] = "rbxassetid://10734900215",
    ["lucide-music-3"] = "rbxassetid://10734905665",
    ["lucide-music-4"] = "rbxassetid://10734905823",
    ["lucide-navigation"] = "rbxassetid://10734906744",
    ["lucide-navigation-2"] = "rbxassetid://10734906332",
    ["lucide-navigation-2-off"] = "rbxassetid://10734906144",
    ["lucide-navigation-off"] = "rbxassetid://10734906580",
    ["lucide-network"] = "rbxassetid://10734906975",
    ["lucide-newspaper"] = "rbxassetid://10734907168",
    ["lucide-octagon"] = "rbxassetid://10734907361",
    ["lucide-option"] = "rbxassetid://10734907649",
    ["lucide-outdent"] = "rbxassetid://10734907933",
    ["lucide-package"] = "rbxassetid://10734909540",
    ["lucide-package-2"] = "rbxassetid://10734908151",
    ["lucide-package-check"] = "rbxassetid://10734908384",
    ["lucide-package-minus"] = "rbxassetid://10734908626",
    ["lucide-package-open"] = "rbxassetid://10734908793",
    ["lucide-package-plus"] = "rbxassetid://10734909016",
    ["lucide-package-search"] = "rbxassetid://10734909196",
    ["lucide-package-x"] = "rbxassetid://10734909375",
    ["lucide-paint-bucket"] = "rbxassetid://10734909847",
    ["lucide-paintbrush"] = "rbxassetid://10734910187",
    ["lucide-paintbrush-2"] = "rbxassetid://10734910030",
    ["lucide-palette"] = "rbxassetid://10734910430",
    ["lucide-palmtree"] = "rbxassetid://10734910680",
    ["lucide-paperclip"] = "rbxassetid://10734910927",
    ["lucide-party-popper"] = "rbxassetid://10734918735",
    ["lucide-pause"] = "rbxassetid://10734919336",
    ["lucide-pause-circle"] = "rbxassetid://10735024209",
    ["lucide-pause-octagon"] = "rbxassetid://10734919143",
    ["lucide-pen-tool"] = "rbxassetid://10734919503",
    ["lucide-pencil"] = "rbxassetid://10734919691",
    ["lucide-percent"] = "rbxassetid://10734919919",
    ["lucide-person-standing"] = "rbxassetid://10734920149",
    ["lucide-phone"] = "rbxassetid://10734921524",
    ["lucide-phone-call"] = "rbxassetid://10734920305",
    ["lucide-phone-forwarded"] = "rbxassetid://10734920508",
    ["lucide-phone-incoming"] = "rbxassetid://10734920694",
    ["lucide-phone-missed"] = "rbxassetid://10734920845",
    ["lucide-phone-off"] = "rbxassetid://10734921077",
    ["lucide-phone-outgoing"] = "rbxassetid://10734921288",
    ["lucide-pie-chart"] = "rbxassetid://10734921727",
    ["lucide-piggy-bank"] = "rbxassetid://10734921935",
    ["lucide-pin"] = "rbxassetid://10734922324",
    ["lucide-pin-off"] = "rbxassetid://10734922180",
    ["lucide-pipette"] = "rbxassetid://10734922497",
    ["lucide-pizza"] = "rbxassetid://10734922774",
    ["lucide-plane"] = "rbxassetid://10734922971",
    ["lucide-play"] = "rbxassetid://10734923549",
    ["lucide-play-circle"] = "rbxassetid://10734923214",
    ["lucide-plus"] = "rbxassetid://10734924532",
    ["lucide-plus-circle"] = "rbxassetid://10734923868",
    ["lucide-plus-square"] = "rbxassetid://10734924219",
    ["lucide-podcast"] = "rbxassetid://10734929553",
    ["lucide-pointer"] = "rbxassetid://10734929723",
    ["lucide-pound-sterling"] = "rbxassetid://10734929981",
    ["lucide-power"] = "rbxassetid://10734930466",
    ["lucide-power-off"] = "rbxassetid://10734930257",
    ["lucide-printer"] = "rbxassetid://10734930632",
    ["lucide-puzzle"] = "rbxassetid://10734930886",
    ["lucide-quote"] = "rbxassetid://10734931234",
    ["lucide-radio"] = "rbxassetid://10734931596",
    ["lucide-radio-receiver"] = "rbxassetid://10734931402",
    ["lucide-rectangle-horizontal"] = "rbxassetid://10734931777",
    ["lucide-rectangle-vertical"] = "rbxassetid://10734932081",
    ["lucide-recycle"] = "rbxassetid://10734932295",
    ["lucide-redo"] = "rbxassetid://10734932822",
    ["lucide-redo-2"] = "rbxassetid://10734932586",
    ["lucide-refresh-ccw"] = "rbxassetid://10734933056",
    ["lucide-refresh-cw"] = "rbxassetid://10734933222",
    ["lucide-refrigerator"] = "rbxassetid://10734933465",
    ["lucide-regex"] = "rbxassetid://10734933655",
    ["lucide-repeat"] = "rbxassetid://10734933966",
    ["lucide-repeat-1"] = "rbxassetid://10734933826",
    ["lucide-reply"] = "rbxassetid://10734934252",
    ["lucide-reply-all"] = "rbxassetid://10734934132",
    ["lucide-rewind"] = "rbxassetid://10734934347",
    ["lucide-rocket"] = "rbxassetid://10734934585",
    ["lucide-rocking-chair"] = "rbxassetid://10734939942",
    ["lucide-rotate-3d"] = "rbxassetid://10734940107",
    ["lucide-rotate-ccw"] = "rbxassetid://10734940376",
    ["lucide-rotate-cw"] = "rbxassetid://10734940654",
    ["lucide-rss"] = "rbxassetid://10734940825",
    ["lucide-ruler"] = "rbxassetid://10734941018",
    ["lucide-russian-ruble"] = "rbxassetid://10734941199",
    ["lucide-sailboat"] = "rbxassetid://10734941354",
    ["lucide-save"] = "rbxassetid://10734941499",
    ["lucide-scale"] = "rbxassetid://10734941912",
    ["lucide-scale-3d"] = "rbxassetid://10734941739",
    ["lucide-scaling"] = "rbxassetid://10734942072",
    ["lucide-scan"] = "rbxassetid://10734942565",
    ["lucide-scan-face"] = "rbxassetid://10734942198",
    ["lucide-scan-line"] = "rbxassetid://10734942351",
    ["lucide-scissors"] = "rbxassetid://10734942778",
    ["lucide-screen-share"] = "rbxassetid://10734943193",
    ["lucide-screen-share-off"] = "rbxassetid://10734942967",
    ["lucide-scroll"] = "rbxassetid://10734943448",
    ["lucide-search"] = "rbxassetid://10734943674",
    ["lucide-send"] = "rbxassetid://10734943902",
    ["lucide-separator-horizontal"] = "rbxassetid://10734944115",
    ["lucide-separator-vertical"] = "rbxassetid://10734944326",
    ["lucide-server"] = "rbxassetid://10734949856",
    ["lucide-server-cog"] = "rbxassetid://10734944444",
    ["lucide-server-crash"] = "rbxassetid://10734944554",
    ["lucide-server-off"] = "rbxassetid://10734944668",
    ["lucide-settings"] = "rbxassetid://10734950309",
    ["lucide-settings-2"] = "rbxassetid://10734950020",
    ["lucide-share"] = "rbxassetid://10734950813",
    ["lucide-share-2"] = "rbxassetid://10734950553",
    ["lucide-sheet"] = "rbxassetid://10734951038",
    ["lucide-shield"] = "rbxassetid://10734951847",
    ["lucide-shield-alert"] = "rbxassetid://10734951173",
    ["lucide-shield-check"] = "rbxassetid://10734951367",
    ["lucide-shield-close"] = "rbxassetid://10734951535",
    ["lucide-shield-off"] = "rbxassetid://10734951684",
    ["lucide-shirt"] = "rbxassetid://10734952036",
    ["lucide-shopping-bag"] = "rbxassetid://10734952273",
    ["lucide-shopping-cart"] = "rbxassetid://10734952479",
    ["lucide-shovel"] = "rbxassetid://10734952773",
    ["lucide-shower-head"] = "rbxassetid://10734952942",
    ["lucide-shrink"] = "rbxassetid://10734953073",
    ["lucide-shrub"] = "rbxassetid://10734953241",
    ["lucide-shuffle"] = "rbxassetid://10734953451",
    ["lucide-sidebar"] = "rbxassetid://10734954301",
    ["lucide-sidebar-close"] = "rbxassetid://10734953715",
    ["lucide-sidebar-open"] = "rbxassetid://10734954000",
    ["lucide-sigma"] = "rbxassetid://10734954538",
    ["lucide-signal"] = "rbxassetid://10734961133",
    ["lucide-signal-high"] = "rbxassetid://10734954807",
    ["lucide-signal-low"] = "rbxassetid://10734955080",
    ["lucide-signal-medium"] = "rbxassetid://10734955336",
    ["lucide-signal-zero"] = "rbxassetid://10734960878",
    ["lucide-siren"] = "rbxassetid://10734961284",
    ["lucide-skip-back"] = "rbxassetid://10734961526",
    ["lucide-skip-forward"] = "rbxassetid://10734961809",
    ["lucide-skull"] = "rbxassetid://10734962068",
    ["lucide-slack"] = "rbxassetid://10734962339",
    ["lucide-slash"] = "rbxassetid://10734962600",
    ["lucide-slice"] = "rbxassetid://10734963024",
    ["lucide-sliders"] = "rbxassetid://10734963400",
    ["lucide-sliders-horizontal"] = "rbxassetid://10734963191",
    ["lucide-smartphone"] = "rbxassetid://10734963940",
    ["lucide-smartphone-charging"] = "rbxassetid://10734963671",
    ["lucide-smile"] = "rbxassetid://10734964441",
    ["lucide-smile-plus"] = "rbxassetid://10734964188",
    ["lucide-snowflake"] = "rbxassetid://10734964600",
    ["lucide-sofa"] = "rbxassetid://10734964852",
    ["lucide-sort-asc"] = "rbxassetid://10734965115",
    ["lucide-sort-desc"] = "rbxassetid://10734965287",
    ["lucide-speaker"] = "rbxassetid://10734965419",
    ["lucide-sprout"] = "rbxassetid://10734965572",
    ["lucide-square"] = "rbxassetid://10734965702",
    ["lucide-star"] = "rbxassetid://10734966248",
    ["lucide-star-half"] = "rbxassetid://10734965897",
    ["lucide-star-off"] = "rbxassetid://10734966097",
    ["lucide-stethoscope"] = "rbxassetid://10734966384",
    ["lucide-sticker"] = "rbxassetid://10734972234",
    ["lucide-sticky-note"] = "rbxassetid://10734972463",
    ["lucide-stop-circle"] = "rbxassetid://10734972621",
    ["lucide-stretch-horizontal"] = "rbxassetid://10734972862",
    ["lucide-stretch-vertical"] = "rbxassetid://10734973130",
    ["lucide-strikethrough"] = "rbxassetid://10734973290",
    ["lucide-subscript"] = "rbxassetid://10734973457",
    ["lucide-sun"] = "rbxassetid://10734974297",
    ["lucide-sun-dim"] = "rbxassetid://10734973645",
    ["lucide-sun-medium"] = "rbxassetid://10734973778",
    ["lucide-sun-moon"] = "rbxassetid://10734973999",
    ["lucide-sun-snow"] = "rbxassetid://10734974130",
    ["lucide-sunrise"] = "rbxassetid://10734974522",
    ["lucide-sunset"] = "rbxassetid://10734974689",
    ["lucide-superscript"] = "rbxassetid://10734974850",
    ["lucide-swiss-franc"] = "rbxassetid://10734975024",
    ["lucide-switch-camera"] = "rbxassetid://10734975214",
    ["lucide-sword"] = "rbxassetid://10734975486",
    ["lucide-swords"] = "rbxassetid://10734975692",
    ["lucide-syringe"] = "rbxassetid://10734975932",
    ["lucide-table"] = "rbxassetid://10734976230",
    ["lucide-table-2"] = "rbxassetid://10734976097",
    ["lucide-tablet"] = "rbxassetid://10734976394",
    ["lucide-tag"] = "rbxassetid://10734976528",
    ["lucide-tags"] = "rbxassetid://10734976739",
    ["lucide-target"] = "rbxassetid://10734977012",
    ["lucide-tent"] = "rbxassetid://10734981750",
    ["lucide-terminal"] = "rbxassetid://10734982144",
    ["lucide-terminal-square"] = "rbxassetid://10734981995",
    ["lucide-text-cursor"] = "rbxassetid://10734982395",
    ["lucide-text-cursor-input"] = "rbxassetid://10734982297",
    ["lucide-thermometer"] = "rbxassetid://10734983134",
    ["lucide-thermometer-snowflake"] = "rbxassetid://10734982571",
    ["lucide-thermometer-sun"] = "rbxassetid://10734982771",
    ["lucide-thumbs-down"] = "rbxassetid://10734983359",
    ["lucide-thumbs-up"] = "rbxassetid://10734983629",
    ["lucide-ticket"] = "rbxassetid://10734983868",
    ["lucide-timer"] = "rbxassetid://10734984606",
    ["lucide-timer-off"] = "rbxassetid://10734984138",
    ["lucide-timer-reset"] = "rbxassetid://10734984355",
    ["lucide-toggle-left"] = "rbxassetid://10734984834",
    ["lucide-toggle-right"] = "rbxassetid://10734985040",
    ["lucide-tornado"] = "rbxassetid://10734985247",
    ["lucide-toy-brick"] = "rbxassetid://10747361919",
    ["lucide-train"] = "rbxassetid://10747362105",
    ["lucide-trash"] = "rbxassetid://10747362393",
    ["lucide-trash-2"] = "rbxassetid://10747362241",
    ["lucide-tree-deciduous"] = "rbxassetid://10747362534",
    ["lucide-tree-pine"] = "rbxassetid://10747362748",
    ["lucide-trees"] = "rbxassetid://10747363016",
    ["lucide-trending-down"] = "rbxassetid://10747363205",
    ["lucide-trending-up"] = "rbxassetid://10747363465",
    ["lucide-triangle"] = "rbxassetid://10747363621",
    ["lucide-trophy"] = "rbxassetid://10747363809",
    ["lucide-truck"] = "rbxassetid://10747364031",
    ["lucide-tv"] = "rbxassetid://10747364593",
    ["lucide-tv-2"] = "rbxassetid://10747364302",
    ["lucide-type"] = "rbxassetid://10747364761",
    ["lucide-umbrella"] = "rbxassetid://10747364971",
    ["lucide-underline"] = "rbxassetid://10747365191",
    ["lucide-undo"] = "rbxassetid://10747365484",
    ["lucide-undo-2"] = "rbxassetid://10747365359",
    ["lucide-unlink"] = "rbxassetid://10747365771",
    ["lucide-unlink-2"] = "rbxassetid://10747397871",
    ["lucide-unlock"] = "rbxassetid://10747366027",
    ["lucide-upload"] = "rbxassetid://10747366434",
    ["lucide-upload-cloud"] = "rbxassetid://10747366266",
    ["lucide-usb"] = "rbxassetid://10747366606",
    ["lucide-user"] = "rbxassetid://10747373176",
    ["lucide-user-check"] = "rbxassetid://10747371901",
    ["lucide-user-cog"] = "rbxassetid://10747372167",
    ["lucide-user-minus"] = "rbxassetid://10747372346",
    ["lucide-user-plus"] = "rbxassetid://10747372702",
    ["lucide-user-x"] = "rbxassetid://10747372992",
    ["lucide-users"] = "rbxassetid://10747373426",
    ["lucide-utensils"] = "rbxassetid://10747373821",
    ["lucide-utensils-crossed"] = "rbxassetid://10747373629",
    ["lucide-venetian-mask"] = "rbxassetid://10747374003",
    ["lucide-verified"] = "rbxassetid://10747374131",
    ["lucide-vibrate"] = "rbxassetid://10747374489",
    ["lucide-vibrate-off"] = "rbxassetid://10747374269",
    ["lucide-video"] = "rbxassetid://10747374938",
    ["lucide-video-off"] = "rbxassetid://10747374721",
    ["lucide-view"] = "rbxassetid://10747375132",
    ["lucide-voicemail"] = "rbxassetid://10747375281",
    ["lucide-volume"] = "rbxassetid://10747376008",
    ["lucide-volume-1"] = "rbxassetid://10747375450",
    ["lucide-volume-2"] = "rbxassetid://10747375679",
    ["lucide-volume-x"] = "rbxassetid://10747375880",
    ["lucide-wallet"] = "rbxassetid://10747376205",
    ["lucide-wand"] = "rbxassetid://10747376565",
    ["lucide-wand-2"] = "rbxassetid://10747376349",
    ["lucide-watch"] = "rbxassetid://10747376722",
    ["lucide-waves"] = "rbxassetid://10747376931",
    ["lucide-webcam"] = "rbxassetid://10747381992",
    ["lucide-wifi"] = "rbxassetid://10747382504",
    ["lucide-wifi-off"] = "rbxassetid://10747382268",
    ["lucide-wind"] = "rbxassetid://10747382750",
    ["lucide-wrap-text"] = "rbxassetid://10747383065",
    ["lucide-wrench"] = "rbxassetid://10747383470",
    ["lucide-x"] = "rbxassetid://10747384394",
    ["lucide-x-circle"] = "rbxassetid://10747383819",
    ["lucide-x-octagon"] = "rbxassetid://10747384037",
    ["lucide-x-square"] = "rbxassetid://10747384217",
    ["lucide-zoom-in"] = "rbxassetid://10747384552",
    ["lucide-zoom-out"] = "rbxassetid://10747384679",
}

setmetatable(Icons, {
    __index = function(tbl, key)
        if type(key) ~= "string" then return nil end
        local raw = rawget(tbl, key)
        if raw then return raw end
        local lk = string.lower(key)
        local lkRaw = rawget(tbl, lk)
        if lkRaw then return lkRaw end
        local lucideKey = "lucide-" .. lk
        if rawget(tbl, lucideKey) then
            return rawget(tbl, lucideKey)
        end
        if lk == "view_in_ar" or lk == "terminal" then
            return rawget(tbl, "Terminal") or "rbxassetid://10734982144"
        elseif lk == "palette" then
            return rawget(tbl, "Palette") or "rbxassetid://10709791100"
        elseif lk == "settings" then
            return rawget(tbl, "Settings") or "rbxassetid://10734950309"
        elseif lk == "notifications_active" or lk == "bell" then
            return rawget(tbl, "Bell") or "rbxassetid://10709775704"
        end
        return nil
    end
})


-- ================= 3 BỘ THEMES TINH TẾ (WHITE, BLACK, GOLD) =================
local THEME_CONFIG_FILE = "CaoTuanAnh_Theme.txt"

local THEMES = {
    ["White"] = {
        Name = "White",
        Accent = Color3.fromRGB(30, 41, 59),
        Bright = Color3.fromRGB(15, 23, 42),
        Light = Color3.fromRGB(51, 65, 85),
        BgCard = Color3.fromRGB(250, 250, 254),
        BgInner = Color3.fromRGB(240, 243, 248),
        Border = Color3.fromRGB(210, 215, 225),
        Line = Color3.fromRGB(220, 225, 235),
        TextPrimary = Color3.fromRGB(15, 23, 42),
        TextSecondary = Color3.fromRGB(71, 85, 105),
        TextMuted = Color3.fromRGB(100, 116, 139),
        Grad1 = Color3.fromRGB(71, 85, 105),
        Grad2 = Color3.fromRGB(15, 23, 42),
    },
    ["Black"] = {
        Name = "Black",
        Accent = Color3.fromRGB(180, 180, 195),
        Bright = Color3.fromRGB(240, 240, 250),
        Light = Color3.fromRGB(220, 220, 230),
        BgCard = Color3.fromRGB(12, 12, 18),
        BgInner = Color3.fromRGB(18, 18, 26),
        Border = Color3.fromRGB(70, 70, 85),
        Line = Color3.fromRGB(50, 50, 65),
        TextPrimary = Color3.fromRGB(250, 250, 255),
        TextSecondary = Color3.fromRGB(160, 160, 175),
        TextMuted = Color3.fromRGB(100, 105, 120),
        Grad1 = Color3.fromRGB(240, 240, 250),
        Grad2 = Color3.fromRGB(130, 130, 140),
    },
    ["Gold"] = {
        Name = "Gold",
        Accent = Color3.fromRGB(245, 158, 11),
        Bright = Color3.fromRGB(255, 215, 0),
        Light = Color3.fromRGB(254, 240, 138),
        BgCard = Color3.fromRGB(13, 13, 20),
        BgInner = Color3.fromRGB(18, 18, 28),
        Border = Color3.fromRGB(245, 158, 11),
        Line = Color3.fromRGB(60, 45, 20),
        TextPrimary = Color3.fromRGB(248, 250, 252),
        TextSecondary = Color3.fromRGB(160, 160, 175),
        TextMuted = Color3.fromRGB(100, 116, 139),
        Grad1 = Color3.fromRGB(255, 224, 102),
        Grad2 = Color3.fromRGB(245, 158, 11),
    },
}

-- Mặc định là theme Black theo yêu cầu người dùng
local CurrentThemeName = "Black"
if readfile and isfile and isfile(THEME_CONFIG_FILE) then
    local s, saved = pcall(readfile, THEME_CONFIG_FILE)
    if s and saved and THEMES[saved] then
        CurrentThemeName = saved
    end
end
local CurrentTheme = THEMES[CurrentThemeName]

-- Quản lý đổi theme trực tiếp cho các đối tượng UI (Đầy đủ Text & Line)
local ThemeRegistry = {
    Borders        = {},
    Accents        = {},
    Lights         = {},
    Cards          = {},
    Inners         = {},
    Grads          = {},
    TextsPrimary   = {},
    TextsSecondary = {},
    Lines          = {},
}

local function RegisterThemeObject(category, obj, prop)
    if ThemeRegistry[category] then
        table.insert(ThemeRegistry[category], { Object = obj, Property = prop or "Color" })
    end
end

local function ApplyTheme(newThemeName)
    if not THEMES[newThemeName] then return end
    CurrentThemeName = newThemeName
    CurrentTheme = THEMES[newThemeName]

    if writefile then
        pcall(writefile, THEME_CONFIG_FILE, newThemeName)
    end

    for _, item in ipairs(ThemeRegistry.Borders) do
        if item.Object and item.Object.Parent then
            TweenService:Create(item.Object, TweenInfo.new(0.3), { [item.Property] = CurrentTheme.Border }):Play()
        end
    end
    for _, item in ipairs(ThemeRegistry.Accents) do
        if item.Object and item.Object.Parent then
            TweenService:Create(item.Object, TweenInfo.new(0.3), { [item.Property] = CurrentTheme.Accent }):Play()
        end
    end
    for _, item in ipairs(ThemeRegistry.Lights) do
        if item.Object and item.Object.Parent then
            TweenService:Create(item.Object, TweenInfo.new(0.3), { [item.Property] = CurrentTheme.Light }):Play()
        end
    end
    for _, item in ipairs(ThemeRegistry.Cards) do
        if item.Object and item.Object.Parent then
            TweenService:Create(item.Object, TweenInfo.new(0.3), { [item.Property] = CurrentTheme.BgCard }):Play()
        end
    end
    for _, item in ipairs(ThemeRegistry.Inners or {}) do
        if item.Object and item.Object.Parent then
            TweenService:Create(item.Object, TweenInfo.new(0.3), { [item.Property] = CurrentTheme.BgInner }):Play()
        end
    end
    for _, item in ipairs(ThemeRegistry.TextsPrimary) do
        if item.Object and item.Object.Parent then
            TweenService:Create(item.Object, TweenInfo.new(0.3), { [item.Property] = CurrentTheme.TextPrimary }):Play()
        end
    end
    for _, item in ipairs(ThemeRegistry.TextsSecondary) do
        if item.Object and item.Object.Parent then
            TweenService:Create(item.Object, TweenInfo.new(0.3), { [item.Property] = CurrentTheme.TextSecondary }):Play()
        end
    end
    for _, item in ipairs(ThemeRegistry.Lines) do
        if item.Object and item.Object.Parent then
            TweenService:Create(item.Object, TweenInfo.new(0.3), { [item.Property] = CurrentTheme.Line or CurrentTheme.Border }):Play()
        end
    end
    for _, item in ipairs(ThemeRegistry.Grads) do
        if item.Object and item.Object.Parent then
            item.Object.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, CurrentTheme.Grad1),
                ColorSequenceKeypoint.new(1, CurrentTheme.Grad2),
            })
        end
    end

    if _G.CaoTuanAnh_ActiveTabRef and _G.CaoTuanAnh_ActiveTabRef.Button then
        local at = _G.CaoTuanAnh_ActiveTabRef
        if at.Button and at.Button.Parent then
            TweenService:Create(at.Button, TweenInfo.new(0.3), { BackgroundColor3 = CurrentTheme.Accent }):Play()
            if at.Stroke then
                TweenService:Create(at.Stroke, TweenInfo.new(0.3), { Color = CurrentTheme.Accent }):Play()
            end
            if at.Indicator then
                TweenService:Create(at.Indicator, TweenInfo.new(0.3), { BackgroundColor3 = CurrentTheme.Bright }):Play()
            end
            if at.Icon then
                TweenService:Create(at.Icon, TweenInfo.new(0.3), { ImageColor3 = CurrentTheme.Bright }):Play()
            end
            if at.Text then
                TweenService:Create(at.Text, TweenInfo.new(0.3), { TextColor3 = CurrentTheme.TextPrimary }):Play()
            end
        end
    end
end

-- ================= HÀM HỖ TRỢ KÉO THẢ (DRAGGABLE) =================
local function enableDrag(dragFrame, handleFrame)
    local dragging, dragInput, dragStart, startPos
    handleFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = dragFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    handleFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local delta = input.Position - dragStart
            dragFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- ================= KHỞI TẠO CỬA SỔ (CREATE WINDOW) =================
function UIScriptHub:CreateWindow(config)
    config = config or {}
    local WindowName = config.Name or "🌸Cao Tuan Anh Roblox🌸"
    local WindowSubtitle = config.Subtitle or "YTB Cao Tuan Anh Roblox"
    local LogoID = config.LogoID or Icons.Logo

    -- Dọn dẹp GUI cũ nếu trùng tên
    if TargetGuiParent:FindFirstChild("CaoTuanAnh_ScriptHubGUI") then
        TargetGuiParent.CaoTuanAnh_ScriptHubGUI:Destroy()
    end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "CaoTuanAnh_ScriptHubGUI"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.Parent = TargetGuiParent

    -- ================= MAIN CARD (CỬA SỔ CHÍNH) =================
    local MainCard = Instance.new("Frame")
    MainCard.Name = "MainCard"
    MainCard.Size = UDim2.new(0, 680, 0, 440)
    MainCard.Position = UDim2.new(0.5, 0, 0.5, 0)
    MainCard.AnchorPoint = Vector2.new(0.5, 0.5)
    MainCard.BackgroundColor3 = CurrentTheme.BgCard
    MainCard.BackgroundTransparency = 0.05
    MainCard.BorderSizePixel = 0
    MainCard.ClipsDescendants = true
    MainCard.Parent = ScreenGui
    RegisterThemeObject("Cards", MainCard, "BackgroundColor3")

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 10)
    MainCorner.Parent = MainCard

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Thickness = 1.5
    MainStroke.Color = CurrentTheme.Border
    MainStroke.Transparency = 0.35
    MainStroke.Parent = MainCard
    RegisterThemeObject("Borders", MainStroke, "Color")

    -- Viền sáng trên đỉnh Card
    local TopGoldLine = Instance.new("Frame")
    TopGoldLine.Name = "TopGoldLine"
    TopGoldLine.Size = UDim2.new(1, -36, 0, 2)
    TopGoldLine.Position = UDim2.new(0, 18, 0, 0)
    TopGoldLine.BackgroundColor3 = CurrentTheme.Bright
    TopGoldLine.BorderSizePixel = 0
    TopGoldLine.ZIndex = 20
    TopGoldLine.Parent = MainCard

    local TopGoldCorner = Instance.new("UICorner")
    TopGoldCorner.CornerRadius = UDim.new(1, 0)
    TopGoldCorner.Parent = TopGoldLine

    local TopGradient = Instance.new("UIGradient")
    TopGradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, CurrentTheme.Grad1),
        ColorSequenceKeypoint.new(1, CurrentTheme.Grad2),
    })
    TopGradient.Parent = TopGoldLine
    RegisterThemeObject("Grads", TopGradient)

    -- ================= TOPBAR =================
    local TopBar = Instance.new("Frame")
    TopBar.Name = "TopBar"
    TopBar.Size = UDim2.new(1, 0, 0, 52)
    TopBar.BackgroundColor3 = Color3.fromRGB(10, 10, 16)
    TopBar.BackgroundTransparency = 1
    TopBar.BorderSizePixel = 0
    TopBar.Parent = MainCard

    local TopBarLine = Instance.new("Frame")
    TopBarLine.Size = UDim2.new(1, 0, 0, 1)
    TopBarLine.Position = UDim2.new(0, 0, 1, -1)
    TopBarLine.BackgroundColor3 = CurrentTheme.Border
    TopBarLine.BackgroundTransparency = 0.8
    TopBarLine.BorderSizePixel = 0
    TopBarLine.Parent = TopBar
    RegisterThemeObject("Lines", TopBarLine, "BackgroundColor3")

    -- Brand Icon & Info
    local BrandLogo = Instance.new("ImageLabel")
    BrandLogo.Name = "BrandLogo"
    BrandLogo.Size = UDim2.new(0, 32, 0, 32)
    BrandLogo.Position = UDim2.new(0, 16, 0.5, 0)
    BrandLogo.AnchorPoint = Vector2.new(0, 0.5)
    BrandLogo.BackgroundTransparency = 1
    BrandLogo.Image = LogoID
    BrandLogo.Parent = TopBar

    local BrandCorner = Instance.new("UICorner")
    BrandCorner.CornerRadius = UDim.new(0, 5)
    BrandCorner.Parent = BrandLogo

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Name = "TitleLabel"
    TitleLabel.Size = UDim2.new(0, 300, 0, 18)
    TitleLabel.Position = UDim2.new(0, 56, 0, 9)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Font = Enum.Font.GothamBold
    TitleLabel.Text = WindowName
    TitleLabel.TextColor3 = CurrentTheme.Light
    TitleLabel.TextSize = 14
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    TitleLabel.Parent = TopBar
    RegisterThemeObject("TextsPrimary", TitleLabel, "TextColor3")

    local SubtitleLabel = Instance.new("TextLabel")
    SubtitleLabel.Name = "SubtitleLabel"
    SubtitleLabel.Size = UDim2.new(0, 300, 0, 14)
    SubtitleLabel.Position = UDim2.new(0, 56, 0, 28)
    SubtitleLabel.BackgroundTransparency = 1
    SubtitleLabel.Font = Enum.Font.Gotham
    SubtitleLabel.Text = WindowSubtitle
    SubtitleLabel.TextColor3 = CurrentTheme.TextSecondary
    RegisterThemeObject("TextsSecondary", SubtitleLabel, "TextColor3")
    SubtitleLabel.TextSize = 10.5
    SubtitleLabel.TextXAlignment = Enum.TextXAlignment.Left
    SubtitleLabel.Parent = TopBar

    -- Topbar Control Buttons: Thu nhỏ [—] & Đóng [X]
    local ControlsHolder = Instance.new("Frame")
    ControlsHolder.Name = "ControlsHolder"
    ControlsHolder.Size = UDim2.new(0, 70, 0, 32)
    ControlsHolder.Position = UDim2.new(1, -16, 0.5, 0)
    ControlsHolder.AnchorPoint = Vector2.new(1, 0.5)
    ControlsHolder.BackgroundTransparency = 1
    ControlsHolder.Parent = TopBar

    local ControlsLayout = Instance.new("UIListLayout")
    ControlsLayout.FillDirection = Enum.FillDirection.Horizontal
    ControlsLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    ControlsLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    ControlsLayout.Padding = UDim.new(0, 8)
    ControlsLayout.Parent = ControlsHolder

    local BtnMinimize = Instance.new("ImageButton")
    BtnMinimize.Name = "BtnMinimize"
    BtnMinimize.Size = UDim2.new(0, 28, 0, 28)
    BtnMinimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BtnMinimize.BackgroundTransparency = 0.92
    BtnMinimize.Image = Icons.Minus
    BtnMinimize.ImageColor3 = Color3.fromRGB(180, 180, 190)
    BtnMinimize.Parent = ControlsHolder

    local MinCorner = Instance.new("UICorner")
    MinCorner.CornerRadius = UDim.new(0, 4)
    MinCorner.Parent = BtnMinimize

    local BtnClose = Instance.new("ImageButton")
    BtnClose.Name = "BtnClose"
    BtnClose.Size = UDim2.new(0, 28, 0, 28)
    BtnClose.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    BtnClose.BackgroundTransparency = 0.85
    BtnClose.Image = Icons.Close
    BtnClose.ImageColor3 = Color3.fromRGB(239, 68, 68)
    BtnClose.Parent = ControlsHolder

    local CloseCorner = Instance.new("UICorner")
    CloseCorner.CornerRadius = UDim.new(0, 4)
    CloseCorner.Parent = BtnClose

    enableDrag(MainCard, TopBar)

    -- ================= BODY: SIDEBAR & CONTENT =================
    local BodyFrame = Instance.new("Frame")
    BodyFrame.Name = "BodyFrame"
    BodyFrame.Size = UDim2.new(1, 0, 1, -52)
    BodyFrame.Position = UDim2.new(0, 0, 0, 52)
    BodyFrame.BackgroundTransparency = 1
    BodyFrame.Parent = MainCard

    -- Sidebar (Bên trái)
    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Size = UDim2.new(0, 180, 1, 0)
    Sidebar.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
    Sidebar.BackgroundTransparency = 1
    Sidebar.BorderSizePixel = 0
    Sidebar.Parent = BodyFrame

    local SidebarDivider = Instance.new("Frame")
    SidebarDivider.Size = UDim2.new(0, 1, 1, 0)
    SidebarDivider.Position = UDim2.new(1, -1, 0, 0)
    SidebarDivider.BackgroundColor3 = CurrentTheme.Border
    SidebarDivider.BackgroundTransparency = 0.85
    SidebarDivider.BorderSizePixel = 0
    SidebarDivider.Parent = Sidebar
    RegisterThemeObject("Lines", SidebarDivider, "BackgroundColor3")

    -- Danh sách Tabs Scroller
    local TabsHolder = Instance.new("ScrollingFrame")
    TabsHolder.Name = "TabsHolder"
    TabsHolder.Size = UDim2.new(1, -16, 1, -78)
    TabsHolder.Position = UDim2.new(0, 8, 0, 12)
    TabsHolder.BackgroundTransparency = 1
    TabsHolder.ScrollBarThickness = 2
    TabsHolder.ScrollBarImageColor3 = CurrentTheme.Accent
    TabsHolder.BorderSizePixel = 0
    TabsHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
    TabsHolder.Parent = Sidebar

    local TabsLayout = Instance.new("UIListLayout")
    TabsLayout.FillDirection = Enum.FillDirection.Vertical
    TabsLayout.Padding = UDim.new(0, 6)
    TabsLayout.Parent = TabsHolder

    TabsLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabsHolder.CanvasSize = UDim2.new(0, 0, 0, TabsLayout.AbsoluteContentSize.Y + 10)
    end)

    -- ================= USER PROFILE BAR (GÓC DƯỚI SIDEBAR) =================
    local UserProfileBox = Instance.new("Frame")
    UserProfileBox.Name = "UserProfileBox"
    UserProfileBox.Size = UDim2.new(1, -16, 0, 52)
    UserProfileBox.Position = UDim2.new(0, 8, 1, -60)
    UserProfileBox.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
    UserProfileBox.BackgroundTransparency = 0.3
    UserProfileBox.Parent = Sidebar

    local UserProfileCorner = Instance.new("UICorner")
    UserProfileCorner.CornerRadius = UDim.new(0, 6)
    UserProfileCorner.Parent = UserProfileBox

    local UserProfileStroke = Instance.new("UIStroke")
    UserProfileStroke.Color = CurrentTheme.Border
    UserProfileStroke.Transparency = 0.75
    UserProfileStroke.Parent = UserProfileBox
    RegisterThemeObject("Borders", UserProfileStroke, "Color")

    -- Avatar người chơi Headshot
    local UserAvatar = Instance.new("ImageLabel")
    UserAvatar.Name = "UserAvatar"
    UserAvatar.Size = UDim2.new(0, 36, 0, 36)
    UserAvatar.Position = UDim2.new(0, 8, 0.5, 0)
    UserAvatar.AnchorPoint = Vector2.new(0, 0.5)
    UserAvatar.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    UserAvatar.BackgroundTransparency = 0.5
    UserAvatar.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
    UserAvatar.Parent = UserProfileBox

    local AvatarCorner = Instance.new("UICorner")
    AvatarCorner.CornerRadius = UDim.new(1, 0)
    AvatarCorner.Parent = UserAvatar

    -- Nạp ảnh avatar bất đồng bộ an toàn
    task.spawn(function()
        pcall(function()
            local thumbType = Enum.ThumbnailType.HeadShot
            local thumbSize = Enum.ThumbnailSize.Size100x100
            local content, isReady = Players:GetUserThumbnailAsync(LocalPlayer.UserId, thumbType, thumbSize)
            if isReady and content then
                UserAvatar.Image = content
            end
        end)
    end)

    local DisplayNameLabel = Instance.new("TextLabel")
    DisplayNameLabel.Name = "DisplayNameLabel"
    DisplayNameLabel.Size = UDim2.new(1, -54, 0, 16)
    DisplayNameLabel.Position = UDim2.new(0, 50, 0, 9)
    DisplayNameLabel.BackgroundTransparency = 1
    DisplayNameLabel.Font = Enum.Font.GothamBold
    DisplayNameLabel.Text = LocalPlayer.DisplayName
    DisplayNameLabel.TextColor3 = CurrentTheme.Light
    DisplayNameLabel.TextSize = 11.5
    DisplayNameLabel.TextXAlignment = Enum.TextXAlignment.Left
    DisplayNameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    DisplayNameLabel.Parent = UserProfileBox
    RegisterThemeObject("TextsPrimary", DisplayNameLabel, "TextColor3")

    local UsernameLabel = Instance.new("TextLabel")
    UsernameLabel.Name = "UsernameLabel"
    UsernameLabel.Size = UDim2.new(1, -54, 0, 14)
    UsernameLabel.Position = UDim2.new(0, 50, 0, 26)
    UsernameLabel.BackgroundTransparency = 1
    UsernameLabel.Font = Enum.Font.Code
    UsernameLabel.Text = "@" .. LocalPlayer.Name
    UsernameLabel.TextColor3 = CurrentTheme.TextSecondary
    RegisterThemeObject("TextsSecondary", UsernameLabel, "TextColor3")
    UsernameLabel.TextSize = 9.5
    UsernameLabel.TextXAlignment = Enum.TextXAlignment.Left
    UsernameLabel.TextTruncate = Enum.TextTruncate.AtEnd
    UsernameLabel.Parent = UserProfileBox

    -- Content Area (Bên phải)
    local ContentHolder = Instance.new("Frame")
    ContentHolder.Name = "ContentHolder"
    ContentHolder.Size = UDim2.new(1, -180, 1, 0)
    ContentHolder.Position = UDim2.new(0, 180, 0, 0)
    ContentHolder.BackgroundTransparency = 1
    ContentHolder.ClipsDescendants = true
    ContentHolder.Parent = BodyFrame

    -- ================= DIALOG POPUP: ĐÓNG HOÀN TOÀN HAY THU NHỎ =================
    local CloseDialogOverlay = Instance.new("Frame")
    CloseDialogOverlay.Name = "CloseDialogOverlay"
    CloseDialogOverlay.Size = UDim2.new(1, 0, 1, 0)
    CloseDialogOverlay.BackgroundColor3 = Color3.fromRGB(6, 6, 9)
    CloseDialogOverlay.BackgroundTransparency = 0.2
    CloseDialogOverlay.ZIndex = 50
    CloseDialogOverlay.Visible = false
    CloseDialogOverlay.Parent = MainCard

    local OverlayCorner = Instance.new("UICorner")
    OverlayCorner.CornerRadius = UDim.new(0, 20)
    OverlayCorner.Parent = CloseDialogOverlay

    local DialogCard = Instance.new("Frame")
    DialogCard.Name = "DialogCard"
    DialogCard.Size = UDim2.new(0, 380, 0, 210)
    DialogCard.Position = UDim2.new(0.5, 0, 0.5, 0)
    DialogCard.AnchorPoint = Vector2.new(0.5, 0.5)
    DialogCard.BackgroundColor3 = Color3.fromRGB(14, 14, 22)
    DialogCard.BorderSizePixel = 0
    DialogCard.ZIndex = 51
    DialogCard.Parent = CloseDialogOverlay

    local DialogCorner = Instance.new("UICorner")
    DialogCorner.CornerRadius = UDim.new(0, 18)
    DialogCorner.Parent = DialogCard

    local DialogStroke = Instance.new("UIStroke")
    DialogStroke.Color = CurrentTheme.Border
    DialogStroke.Thickness = 1.5
    DialogStroke.Parent = DialogCard
    RegisterThemeObject("Borders", DialogStroke, "Color")

    local DialogTitle = Instance.new("TextLabel")
    DialogTitle.Size = UDim2.new(1, -30, 0, 24)
    DialogTitle.Position = UDim2.new(0, 15, 0, 16)
    DialogTitle.BackgroundTransparency = 1
    DialogTitle.Font = Enum.Font.GothamBold
    DialogTitle.Text = "Tùy Chọn Đóng Giao Diện"
    DialogTitle.TextColor3 = CurrentTheme.Light
    DialogTitle.TextSize = 16
    DialogTitle.ZIndex = 52
    DialogTitle.Parent = DialogCard
    RegisterThemeObject("Lights", DialogTitle, "TextColor3")

    local DialogDesc = Instance.new("TextLabel")
    DialogDesc.Size = UDim2.new(1, -30, 0, 36)
    DialogDesc.Position = UDim2.new(0, 15, 0, 42)
    DialogDesc.BackgroundTransparency = 1
    DialogDesc.Font = Enum.Font.Gotham
    DialogDesc.Text = "Bạn có muốn thu nhỏ giao diện thành biểu tượng nổi trên màn hình hay thoát hoàn toàn script?"
    DialogDesc.TextColor3 = Color3.fromRGB(148, 163, 184)
    DialogDesc.TextSize = 12
    DialogDesc.TextWrapped = true
    DialogDesc.ZIndex = 52
    DialogDesc.Parent = DialogCard

    -- 2 Nút lựa chọn: Thu nhỏ và Thoát hoàn toàn
    local BtnChoiceMinimize = Instance.new("TextButton")
    BtnChoiceMinimize.Size = UDim2.new(1, -30, 0, 38)
    BtnChoiceMinimize.Position = UDim2.new(0, 15, 0, 88)
    BtnChoiceMinimize.BackgroundColor3 = CurrentTheme.Accent
    BtnChoiceMinimize.BackgroundTransparency = 0.25
    BtnChoiceMinimize.Font = Enum.Font.GothamBold
    BtnChoiceMinimize.Text = "⚡  Thu Nhỏ Thành Nút Nổi"
    BtnChoiceMinimize.TextColor3 = Color3.fromRGB(10, 10, 16)
    BtnChoiceMinimize.TextSize = 13
    BtnChoiceMinimize.ZIndex = 52
    BtnChoiceMinimize.Parent = DialogCard
    RegisterThemeObject("Accents", BtnChoiceMinimize, "BackgroundColor3")

    local ChoiceMinCorner = Instance.new("UICorner")
    ChoiceMinCorner.CornerRadius = UDim.new(0, 10)
    ChoiceMinCorner.Parent = BtnChoiceMinimize

    local BtnChoiceDestroy = Instance.new("TextButton")
    BtnChoiceDestroy.Size = UDim2.new(0.58, -18, 0, 34)
    BtnChoiceDestroy.Position = UDim2.new(0, 15, 0, 134)
    BtnChoiceDestroy.BackgroundColor3 = Color3.fromRGB(239, 68, 68)
    BtnChoiceDestroy.BackgroundTransparency = 0.35
    BtnChoiceDestroy.Font = Enum.Font.GothamBold
    BtnChoiceDestroy.Text = "🚪  Đóng Hoàn Toàn"
    BtnChoiceDestroy.TextColor3 = Color3.fromRGB(255, 255, 255)
    BtnChoiceDestroy.TextSize = 12
    BtnChoiceDestroy.ZIndex = 52
    BtnChoiceDestroy.Parent = DialogCard

    local ChoiceDesCorner = Instance.new("UICorner")
    ChoiceDesCorner.CornerRadius = UDim.new(0, 10)
    ChoiceDesCorner.Parent = BtnChoiceDestroy

    local BtnChoiceCancel = Instance.new("TextButton")
    BtnChoiceCancel.Size = UDim2.new(0.42, -18, 0, 34)
    BtnChoiceCancel.Position = UDim2.new(0.58, 3, 0, 134)
    BtnChoiceCancel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BtnChoiceCancel.BackgroundTransparency = 0.92
    BtnChoiceCancel.Font = Enum.Font.GothamMedium
    BtnChoiceCancel.Text = "Hủy Bỏ"
    BtnChoiceCancel.TextColor3 = Color3.fromRGB(160, 160, 175)
    BtnChoiceCancel.TextSize = 12
    BtnChoiceCancel.ZIndex = 52
    BtnChoiceCancel.Parent = DialogCard

    local ChoiceCancelCorner = Instance.new("UICorner")
    ChoiceCancelCorner.CornerRadius = UDim.new(0, 10)
    ChoiceCancelCorner.Parent = BtnChoiceCancel

    local function showCloseDialog()
        CloseDialogOverlay.Visible = true
        CloseDialogOverlay.BackgroundTransparency = 1
        DialogCard.Position = UDim2.new(0.5, 0, 0.5, 20)
        DialogCard.Size = UDim2.new(0, 350, 0, 190)

        TweenService:Create(CloseDialogOverlay, TweenInfo.new(0.25), { BackgroundTransparency = 0.25 }):Play()
        TweenService:Create(DialogCard, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(0, 380, 0, 210)
        }):Play()
    end

    local function hideCloseDialog()
        TweenService:Create(CloseDialogOverlay, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
        TweenService:Create(DialogCard, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Position = UDim2.new(0.5, 0, 0.5, 20)
        }):Play()
        task.wait(0.22)
        CloseDialogOverlay.Visible = false
    end

    BtnClose.MouseButton1Click:Connect(showCloseDialog)
    BtnChoiceCancel.MouseButton1Click:Connect(hideCloseDialog)

    -- ================= FLOATING MINI WIDGET (NÚT TRÒN NỔI TỰ DO) =================
    local FloatingWidget = Instance.new("Frame")
    FloatingWidget.Name = "FloatingWidget"
    FloatingWidget.Size = UDim2.new(0, 52, 0, 52)
    FloatingWidget.Position = UDim2.new(0.92, -30, 0.15, 0)
    FloatingWidget.BackgroundColor3 = CurrentTheme.BgCard
    FloatingWidget.BackgroundTransparency = 0.1
    FloatingWidget.Visible = false
    FloatingWidget.ZIndex = 60
    FloatingWidget.Parent = ScreenGui
    RegisterThemeObject("Cards", FloatingWidget, "BackgroundColor3")

    local WidgetCorner = Instance.new("UICorner")
    WidgetCorner.CornerRadius = UDim.new(1, 0)
    WidgetCorner.Parent = FloatingWidget

    local WidgetStroke = Instance.new("UIStroke")
    WidgetStroke.Color = CurrentTheme.Bright
    WidgetStroke.Thickness = 2
    WidgetStroke.Parent = FloatingWidget
    RegisterThemeObject("Borders", WidgetStroke, "Color")

    local WidgetLogo = Instance.new("ImageLabel")
    WidgetLogo.Size = UDim2.new(1, -12, 1, -12)
    WidgetLogo.Position = UDim2.new(0.5, 0, 0.5, 0)
    WidgetLogo.AnchorPoint = Vector2.new(0.5, 0.5)
    WidgetLogo.BackgroundTransparency = 1
    WidgetLogo.Image = LogoID
    WidgetLogo.ZIndex = 61
    WidgetLogo.Parent = FloatingWidget

    local WidgetLogoCorner = Instance.new("UICorner")
    WidgetLogoCorner.CornerRadius = UDim.new(1, 0)
    WidgetLogoCorner.Parent = WidgetLogo

    enableDrag(FloatingWidget, FloatingWidget)

    -- Khung chứa 2 nút vệ tinh bung ra từ nút nổi
    local SubButtonsContainer = Instance.new("Frame")
    SubButtonsContainer.Name = "SubButtonsContainer"
    SubButtonsContainer.Size = UDim2.new(0, 180, 0, 110)
    SubButtonsContainer.Position = UDim2.new(0, -190, 0.5, -55)
    SubButtonsContainer.BackgroundTransparency = 1
    SubButtonsContainer.ZIndex = 62
    SubButtonsContainer.Visible = false
    SubButtonsContainer.Parent = FloatingWidget

    local SubButtonsLayout = Instance.new("UIListLayout")
    SubButtonsLayout.FillDirection = Enum.FillDirection.Vertical
    SubButtonsLayout.Padding = UDim.new(0, 8)
    SubButtonsLayout.Parent = SubButtonsContainer

    -- Vệ tinh 1: Nút Mở Giao Diện (Open GUI)
    local SubBtnOpen = Instance.new("TextButton")
    SubBtnOpen.Name = "SubBtnOpen"
    SubBtnOpen.Size = UDim2.new(1, 0, 0, 48)
    SubBtnOpen.BackgroundColor3 = Color3.fromRGB(14, 14, 22)
    SubBtnOpen.BackgroundTransparency = 0.15
    SubBtnOpen.Text = ""
    SubBtnOpen.ZIndex = 63
    SubBtnOpen.Parent = SubButtonsContainer

    local SubOpenCorner = Instance.new("UICorner")
    SubOpenCorner.CornerRadius = UDim.new(0, 12)
    SubOpenCorner.Parent = SubBtnOpen

    local SubOpenStroke = Instance.new("UIStroke")
    SubOpenStroke.Color = CurrentTheme.Border
    SubOpenStroke.Thickness = 1.2
    SubOpenStroke.Parent = SubBtnOpen
    RegisterThemeObject("Borders", SubOpenStroke, "Color")

    local SubOpenIcon = Instance.new("ImageLabel")
    SubOpenIcon.Size = UDim2.new(0, 22, 0, 22)
    SubOpenIcon.Position = UDim2.new(0, 10, 0.5, 0)
    SubOpenIcon.AnchorPoint = Vector2.new(0, 0.5)
    SubOpenIcon.BackgroundTransparency = 1
    SubOpenIcon.Image = Icons.External
    SubOpenIcon.ImageColor3 = CurrentTheme.Bright
    SubOpenIcon.ZIndex = 64
    SubOpenIcon.Parent = SubBtnOpen
    RegisterThemeObject("Borders", SubOpenIcon, "ImageColor3")

    local SubOpenTitle = Instance.new("TextLabel")
    SubOpenTitle.Size = UDim2.new(1, -40, 0, 16)
    SubOpenTitle.Position = UDim2.new(0, 38, 0, 7)
    SubOpenTitle.BackgroundTransparency = 1
    SubOpenTitle.Font = Enum.Font.GothamBold
    SubOpenTitle.Text = "Mở Giao Diện"
    SubOpenTitle.TextColor3 = CurrentTheme.Light
    SubOpenTitle.TextSize = 12
    SubOpenTitle.TextXAlignment = Enum.TextXAlignment.Left
    SubOpenTitle.ZIndex = 64
    SubOpenTitle.Parent = SubBtnOpen
    RegisterThemeObject("Lights", SubOpenTitle, "TextColor3")

    local SubOpenDesc = Instance.new("TextLabel")
    SubOpenDesc.Size = UDim2.new(1, -40, 0, 14)
    SubOpenDesc.Position = UDim2.new(0, 38, 0, 24)
    SubOpenDesc.BackgroundTransparency = 1
    SubOpenDesc.Font = Enum.Font.Gotham
    SubOpenDesc.Text = "Khôi phục cửa sổ Hub"
    SubOpenDesc.TextColor3 = Color3.fromRGB(148, 163, 184)
    SubOpenDesc.TextSize = 9.5
    SubOpenDesc.TextXAlignment = Enum.TextXAlignment.Left
    SubOpenDesc.ZIndex = 64
    SubOpenDesc.Parent = SubBtnOpen

    -- Vệ tinh 2: Nút Đóng Hoàn Toàn (Destroy Script)
    local SubBtnDestroy = Instance.new("TextButton")
    SubBtnDestroy.Name = "SubBtnDestroy"
    SubBtnDestroy.Size = UDim2.new(1, 0, 0, 48)
    SubBtnDestroy.BackgroundColor3 = Color3.fromRGB(24, 10, 12)
    SubBtnDestroy.BackgroundTransparency = 0.15
    SubBtnDestroy.Text = ""
    SubBtnDestroy.ZIndex = 63
    SubBtnDestroy.Parent = SubButtonsContainer

    local SubDestroyCorner = Instance.new("UICorner")
    SubDestroyCorner.CornerRadius = UDim.new(0, 12)
    SubDestroyCorner.Parent = SubBtnDestroy

    local SubDestroyStroke = Instance.new("UIStroke")
    SubDestroyStroke.Color = Color3.fromRGB(239, 68, 68)
    SubDestroyStroke.Thickness = 1.2
    SubDestroyStroke.Parent = SubBtnDestroy

    local SubDestroyIcon = Instance.new("ImageLabel")
    SubDestroyIcon.Size = UDim2.new(0, 22, 0, 22)
    SubDestroyIcon.Position = UDim2.new(0, 10, 0.5, 0)
    SubDestroyIcon.AnchorPoint = Vector2.new(0, 0.5)
    SubDestroyIcon.BackgroundTransparency = 1
    SubDestroyIcon.Image = Icons.Exit
    SubDestroyIcon.ImageColor3 = Color3.fromRGB(239, 68, 68)
    SubDestroyIcon.ZIndex = 64
    SubDestroyIcon.Parent = SubBtnDestroy

    local SubDestroyTitle = Instance.new("TextLabel")
    SubDestroyTitle.Size = UDim2.new(1, -40, 0, 16)
    SubDestroyTitle.Position = UDim2.new(0, 38, 0, 7)
    SubDestroyTitle.BackgroundTransparency = 1
    SubDestroyTitle.Font = Enum.Font.GothamBold
    SubDestroyTitle.Text = "Thoát Hoàn Toàn"
    SubDestroyTitle.TextColor3 = Color3.fromRGB(254, 202, 202)
    SubDestroyTitle.TextSize = 12
    SubDestroyTitle.TextXAlignment = Enum.TextXAlignment.Left
    SubDestroyTitle.ZIndex = 64
    SubDestroyTitle.Parent = SubBtnDestroy

    local SubDestroyDesc = Instance.new("TextLabel")
    SubDestroyDesc.Size = UDim2.new(1, -40, 0, 14)
    SubDestroyDesc.Position = UDim2.new(0, 38, 0, 24)
    SubDestroyDesc.BackgroundTransparency = 1
    SubDestroyDesc.Font = Enum.Font.Gotham
    SubDestroyDesc.Text = "Xóa GUI và dọn bộ nhớ"
    SubDestroyDesc.TextColor3 = Color3.fromRGB(180, 130, 130)
    SubDestroyDesc.TextSize = 9.5
    SubDestroyDesc.TextXAlignment = Enum.TextXAlignment.Left
    SubDestroyDesc.ZIndex = 64
    SubDestroyDesc.Parent = SubBtnDestroy

    -- Logic chuyển sang Floating Widget
    local function switchToFloatingWidget()
        hideCloseDialog()
        TweenService:Create(MainCard, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 100, 0, 60),
            Position = FloatingWidget.Position,
            BackgroundTransparency = 1
        }):Play()
        task.wait(0.36)
        MainCard.Visible = false

        FloatingWidget.Visible = true
        FloatingWidget.Size = UDim2.new(0, 10, 0, 10)
        TweenService:Create(FloatingWidget, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 52, 0, 52)
        }):Play()
    end

    local function restoreFromFloatingWidget()
        -- Co thu 2 nút vệ tinh lại
        SubButtonsContainer.Visible = false
        TweenService:Create(FloatingWidget, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 10, 0, 10)
        }):Play()
        task.wait(0.26)
        FloatingWidget.Visible = false

        MainCard.Visible = true
        MainCard.Size = UDim2.new(0, 300, 0, 180)
        MainCard.Position = UDim2.new(0.5, 0, 0.5, 0)
        MainCard.BackgroundTransparency = 0.05
        TweenService:Create(MainCard, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.new(0, 680, 0, 440)
        }):Play()
    end

    local function destroyCompletely()
        hideCloseDialog()
        TweenService:Create(MainCard, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size = UDim2.new(0, 200, 0, 100),
            BackgroundTransparency = 1
        }):Play()
        task.wait(0.32)
        ScreenGui:Destroy()
    end

    BtnChoiceMinimize.MouseButton1Click:Connect(switchToFloatingWidget)
    BtnMinimize.MouseButton1Click:Connect(switchToFloatingWidget)
    BtnChoiceDestroy.MouseButton1Click:Connect(destroyCompletely)

    -- Toggle bung 2 nút con khi click vào Floating Widget
    local isSubExpanded = false
    WidgetLogo.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            -- Hiệu ứng Pop Bounce
            TweenService:Create(FloatingWidget, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 60, 0, 60)
            }):Play()
            task.delay(0.12, function()
                TweenService:Create(FloatingWidget, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Size = UDim2.new(0, 52, 0, 52)
                }):Play()
            end)

            isSubExpanded = not isSubExpanded
            if isSubExpanded then
                SubButtonsContainer.Visible = true
                SubButtonsContainer.Position = UDim2.new(0, -100, 0.5, -55)
                TweenService:Create(SubButtonsContainer, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0, -190, 0.5, -55)
                }):Play()
            else
                TweenService:Create(SubButtonsContainer, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                    Position = UDim2.new(0, -100, 0.5, -55)
                }):Play()
                task.delay(0.2, function()
                    if not isSubExpanded then
                        SubButtonsContainer.Visible = false
                    end
                end)
            end
        end
    end)

    SubBtnOpen.MouseButton1Click:Connect(function()
        isSubExpanded = false
        restoreFromFloatingWidget()
    end)

    SubBtnDestroy.MouseButton1Click:Connect(function()
        ScreenGui:Destroy()
    end)

    -- ================= WINDOW OBJECT IMPLEMENTATION =================
    local Window = {
        ScreenGui = ScreenGui,
        MainCard = MainCard,
        ContentHolder = ContentHolder,
        TabsHolder = TabsHolder,
        Tabs = {},
        ActiveTab = nil,
    }

    -- ================= TAB CREATION =================
        -- ================= CATEGORY HEADER IN SIDEBAR =================
    function Window:CreateCategory(categoryTitle)
        local CategoryFrame = Instance.new("Frame")
        CategoryFrame.Name = "Category_" .. tostring(categoryTitle)
        CategoryFrame.Size = UDim2.new(1, 0, 0, 22)
        CategoryFrame.BackgroundTransparency = 1
        CategoryFrame.BorderSizePixel = 0
        CategoryFrame.Parent = TabsHolder

        local CategoryText = Instance.new("TextLabel")
        CategoryText.Name = "CategoryText"
        CategoryText.Size = UDim2.new(1, -12, 1, 0)
        CategoryText.Position = UDim2.new(0, 10, 0, 0)
        CategoryText.BackgroundTransparency = 1
        CategoryText.Font = Enum.Font.GothamBold
        CategoryText.Text = string.upper(tostring(categoryTitle))
        CategoryText.TextColor3 = Color3.fromRGB(115, 120, 135)
        CategoryText.TextSize = 10
        CategoryText.TextXAlignment = Enum.TextXAlignment.Left
        CategoryText.Parent = CategoryFrame

        return CategoryFrame
    end

function Window:CreateTab(tabConfig)
        tabConfig = tabConfig or {}
        local TabName = tabConfig.Name or "Tab Mới"
        local TabIcon = tabConfig.Icon or "Terminal"

        -- Mapping icon linh hoạt
        local resolvedIcon = Icons[TabIcon] or Icons.Terminal
        if TabIcon == "view_in_ar" or TabIcon == "Terminal" then
            resolvedIcon = Icons.Terminal
        elseif TabIcon == "palette" or TabIcon == "Palette" then
            resolvedIcon = Icons.Palette
        elseif TabIcon == "settings" or TabIcon == "Settings" then
            resolvedIcon = Icons.Settings
        elseif TabIcon == "notifications_active" then
            resolvedIcon = Icons.Bell
        elseif TabIcon == "Home" or TabIcon == "home" then
            resolvedIcon = Icons.Home
        end

        -- Nút Tab ở Sidebar (Bán trong suốt / trong suốt tinh tế chuẩn Fluent & Luna UI)
        local TabButton = Instance.new("TextButton")
        TabButton.Name = "Tab_" .. TabName
        TabButton.Size = UDim2.new(1, 0, 0, 36)
        TabButton.BackgroundColor3 = CurrentTheme.Accent
        TabButton.BackgroundTransparency = 1
        TabButton.Text = ""
        TabButton.AutoButtonColor = false
        TabButton.Parent = TabsHolder

        local TabBtnCorner = Instance.new("UICorner")
        TabBtnCorner.CornerRadius = UDim.new(0, 6) -- Bo nhẹ 6px
        TabBtnCorner.Parent = TabButton

        local TabBtnStroke = Instance.new("UIStroke")
        TabBtnStroke.Name = "TabBtnStroke"
        TabBtnStroke.Color = CurrentTheme.Accent
        TabBtnStroke.Transparency = 1
        TabBtnStroke.Thickness = 1
        TabBtnStroke.Parent = TabButton

        -- Thanh chỉ thị màu Accent ở mép trái (Fluent Active Indicator)
        local TabIndicator = Instance.new("Frame")
        TabIndicator.Name = "TabIndicator"
        TabIndicator.Size = UDim2.new(0, 3, 0, 18)
        TabIndicator.Position = UDim2.new(0, 2, 0.5, 0)
        TabIndicator.AnchorPoint = Vector2.new(0, 0.5)
        TabIndicator.BackgroundColor3 = CurrentTheme.Bright
        TabIndicator.BackgroundTransparency = 1
        TabIndicator.BorderSizePixel = 0
        TabIndicator.Parent = TabButton

        local IndCorner = Instance.new("UICorner")
        IndCorner.CornerRadius = UDim.new(1, 0)
        IndCorner.Parent = TabIndicator

        local TabBtnIcon = Instance.new("ImageLabel")
        TabBtnIcon.Name = "TabBtnIcon"
        TabBtnIcon.Size = UDim2.new(0, 18, 0, 18)
        TabBtnIcon.Position = UDim2.new(0, 12, 0.5, 0)
        TabBtnIcon.AnchorPoint = Vector2.new(0, 0.5)
        TabBtnIcon.BackgroundTransparency = 1
        TabBtnIcon.Image = resolvedIcon
        TabBtnIcon.ImageColor3 = Color3.fromRGB(150, 155, 170)
        TabBtnIcon.Parent = TabButton

        local TabBtnText = Instance.new("TextLabel")
        TabBtnText.Name = "TabBtnText"
        TabBtnText.Size = UDim2.new(1, -40, 1, 0)
        TabBtnText.Position = UDim2.new(0, 36, 0, 0)
        TabBtnText.BackgroundTransparency = 1
        TabBtnText.Font = Enum.Font.GothamMedium
        TabBtnText.Text = TabName
        TabBtnText.TextColor3 = Color3.fromRGB(150, 155, 170)
        TabBtnText.TextSize = 12
        TabBtnText.TextXAlignment = Enum.TextXAlignment.Left
        TabBtnText.Parent = TabButton

        -- Trang nội dung của Tab
        local TabPage = Instance.new("ScrollingFrame")
        TabPage.Name = "Page_" .. TabName
        TabPage.Size = UDim2.new(1, -16, 1, -16)
        TabPage.Position = UDim2.new(0, 8, 0, 8)
        TabPage.BackgroundTransparency = 1
        TabPage.ScrollBarThickness = 3
        TabPage.ScrollBarImageColor3 = CurrentTheme.Accent
        TabPage.BorderSizePixel = 0
        TabPage.CanvasSize = UDim2.new(0, 0, 0, 0)
        TabPage.Visible = false
        TabPage.Parent = ContentHolder

        -- Padding chuẩn: padding-left 5px và padding-right 8px chống tràn chạm frame
        local TabPadding = Instance.new("UIPadding")
        TabPadding.PaddingLeft = UDim.new(0, 5)
        TabPadding.PaddingRight = UDim.new(0, 8)
        TabPadding.PaddingTop = UDim.new(0, 4)
        TabPadding.PaddingBottom = UDim.new(0, 8)
        TabPadding.Parent = TabPage

        local PageLayout = Instance.new("UIListLayout")
        PageLayout.FillDirection = Enum.FillDirection.Vertical
        PageLayout.Padding = UDim.new(0, 8)
        PageLayout.Parent = TabPage

        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 20)
        end)

        local TabObj = {
            Button = TabButton,
            Page = TabPage,
            Name = TabName,
            Stroke = TabBtnStroke,
            Icon = TabBtnIcon,
            Text = TabBtnText,
            Indicator = TabIndicator,
        }

        local function activateTab()
            for _, other in pairs(Window.Tabs) do
                other.Page.Visible = false
                other.Button.BackgroundTransparency = 1
                if other.Stroke then
                    other.Stroke.Transparency = 1
                elseif other.Button:FindFirstChild("TabBtnStroke") then
                    other.Button.TabBtnStroke.Transparency = 1
                end
                if other.Icon then
                    other.Icon.ImageColor3 = Color3.fromRGB(150, 155, 170)
                elseif other.Button:FindFirstChild("TabBtnIcon") then
                    other.Button.TabBtnIcon.ImageColor3 = Color3.fromRGB(150, 155, 170)
                end
                if other.Text then
                    other.Text.TextColor3 = Color3.fromRGB(150, 155, 170)
                    other.Text.Font = Enum.Font.GothamMedium
                elseif other.Button:FindFirstChild("TabBtnText") then
                    other.Button.TabBtnText.TextColor3 = Color3.fromRGB(150, 155, 170)
                    other.Button.TabBtnText.Font = Enum.Font.GothamMedium
                end
                if other.Indicator then
                    other.Indicator.BackgroundTransparency = 1
                elseif other.Button:FindFirstChild("TabIndicator") then
                    other.Button.TabIndicator.BackgroundTransparency = 1
                end
            end
            TabPage.Visible = true
            TabButton.BackgroundTransparency = 0.88
            TabButton.BackgroundColor3 = CurrentTheme.Accent
            TabBtnStroke.Transparency = 0.65
            TabBtnStroke.Color = CurrentTheme.Accent
            TabBtnIcon.ImageColor3 = CurrentTheme.Bright
            TabBtnText.TextColor3 = CurrentTheme.TextPrimary
            TabBtnText.Font = Enum.Font.GothamBold
            TabIndicator.BackgroundTransparency = 0
            TabIndicator.BackgroundColor3 = CurrentTheme.Bright
            Window.ActiveTab = TabObj
            _G.CaoTuanAnh_ActiveTabRef = TabObj
        end

        -- Hover effects
        TabButton.MouseEnter:Connect(function()
            if Window.ActiveTab ~= TabObj then
                TweenService:Create(TabButton, TweenInfo.new(0.2), { BackgroundTransparency = 0.94 }):Play()
                TweenService:Create(TabBtnIcon, TweenInfo.new(0.2), { ImageColor3 = CurrentTheme.Bright }):Play()
                TweenService:Create(TabBtnText, TweenInfo.new(0.2), { TextColor3 = CurrentTheme.Bright }):Play()
            end
        end)

        TabButton.MouseLeave:Connect(function()
            if Window.ActiveTab ~= TabObj then
                TweenService:Create(TabButton, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
                TweenService:Create(TabBtnIcon, TweenInfo.new(0.2), { ImageColor3 = Color3.fromRGB(150, 155, 170) }):Play()
                TweenService:Create(TabBtnText, TweenInfo.new(0.2), { TextColor3 = Color3.fromRGB(150, 155, 170) }):Play()
            end
        end)

        TabButton.MouseButton1Click:Connect(activateTab)

        -- ================= DỰNG BANNER TRANG CHỦ / DASHBOARD TRONG TAB =================
        function TabObj:CreateHomeBanner(homeConfig)
            homeConfig = homeConfig or {}

            local BannerFrame = Instance.new("Frame")
            BannerFrame.Name = "HomeDashboardBanner"
            BannerFrame.Size = UDim2.new(1, 0, 0, 138)
            BannerFrame.BackgroundColor3 = CurrentTheme.BgCard
            BannerFrame.BackgroundTransparency = 0.72
            BannerFrame.BorderSizePixel = 0
            BannerFrame.Parent = TabPage
            RegisterThemeObject("Cards", BannerFrame, "BackgroundColor3")

            local BannerCorner = Instance.new("UICorner")
            BannerCorner.CornerRadius = UDim.new(0, 6) -- Bo nhẹ 6px
            BannerCorner.Parent = BannerFrame

            local BannerStroke = Instance.new("UIStroke")
            BannerStroke.Color = CurrentTheme.Border
            BannerStroke.Transparency = 0.7
            BannerStroke.Parent = BannerFrame
            RegisterThemeObject("Borders", BannerStroke, "Color")

            -- Accent Strip mép trái
            local AccentStrip = Instance.new("Frame")
            AccentStrip.Size = UDim2.new(0, 3.5, 1, 0)
            AccentStrip.BackgroundColor3 = CurrentTheme.Accent
            AccentStrip.BorderSizePixel = 0
            AccentStrip.Parent = BannerFrame
            RegisterThemeObject("Accents", AccentStrip, "BackgroundColor3")

            local StripCorner = Instance.new("UICorner")
            StripCorner.CornerRadius = UDim.new(0, 2)
            StripCorner.Parent = AccentStrip

            -- Title info to rõ ràng
            local Title = Instance.new("TextLabel")
            Title.Size = UDim2.new(1, -28, 0, 24)
            Title.Position = UDim2.new(0, 16, 0, 12)
            Title.BackgroundTransparency = 1
            Title.Font = Enum.Font.GothamBold
            Title.Text = "🌸 Cao Tuấn Anh Roblox Hub 🌸"
            Title.TextColor3 = CurrentTheme.Light
            Title.TextSize = 15.5
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = BannerFrame
            RegisterThemeObject("Lights", Title, "TextColor3")

            -- Description to dễ đọc
            local Desc = Instance.new("TextLabel")
            Desc.Size = UDim2.new(1, -28, 0, 38)
            Desc.Position = UDim2.new(0, 16, 0, 38)
            Desc.BackgroundTransparency = 1
            Desc.Font = Enum.Font.GothamMedium
            Desc.Text = "Hệ thống tổng hợp script Roblox VIP độc quyền. Tối ưu hóa hiệu năng, bảo mật và tương thích mượt mà cho mọi thiết bị."
            Desc.TextColor3 = CurrentTheme.TextSecondary
            Desc.TextSize = 12
            Desc.TextWrapped = true
            Desc.TextXAlignment = Enum.TextXAlignment.Left
            Desc.Parent = BannerFrame
            RegisterThemeObject("TextsSecondary", Desc, "TextColor3")

            -- Badge: Script Tương Thích Hầu Hết Cái Expoilt Hiện tại : 89%
            local CompatBadge = Instance.new("Frame")
            CompatBadge.Name = "CompatBadge"
            CompatBadge.Size = UDim2.new(1, -32, 0, 32)
            CompatBadge.Position = UDim2.new(0, 16, 0, 88)
            CompatBadge.BackgroundColor3 = CurrentTheme.BgInner
            CompatBadge.BackgroundTransparency = 0.5
            CompatBadge.BorderSizePixel = 0
            CompatBadge.Parent = BannerFrame
            RegisterThemeObject("Cards", CompatBadge, "BackgroundColor3")

            local CompatCorner = Instance.new("UICorner")
            CompatCorner.CornerRadius = UDim.new(0, 5) -- Bo nhẹ 5px
            CompatCorner.Parent = CompatBadge

            local CompatStroke = Instance.new("UIStroke")
            CompatStroke.Color = CurrentTheme.Border
            CompatStroke.Transparency = 0.75
            CompatStroke.Parent = CompatBadge
            RegisterThemeObject("Borders", CompatStroke, "Color")

            local CompatText = Instance.new("TextLabel")
            CompatText.Name = "CompatText"
            CompatText.Size = UDim2.new(1, -20, 1, 0)
            CompatText.Position = UDim2.new(0, 12, 0, 0)
            CompatText.BackgroundTransparency = 1
            CompatText.Font = Enum.Font.GothamBold
            CompatText.Text = "Script Tương Thích Hầu Hết Cái Expoilt Hiện tại : 89%"
            CompatText.TextColor3 = CurrentTheme.Light
            CompatText.TextSize = 12
            CompatText.TextXAlignment = Enum.TextXAlignment.Left
            CompatText.Parent = CompatBadge
            RegisterThemeObject("Lights", CompatText, "TextColor3")

            return BannerFrame
        end

        -- ================= SCRIPT CARD =================
        function TabObj:CreateButton(btnConfig)
            btnConfig = btnConfig or {}
            local Name = btnConfig.Name or "Nút Bấm"
            local Desc = btnConfig.Description or ""
            local Badge = btnConfig.Badge or ""
            local Callback = btnConfig.Callback or function() end
            local IsPreset = (btnConfig.IsPreset == true) or (string.find(Name, "Eclipse") ~= nil)

            local CardFrame = Instance.new("Frame")
            CardFrame.Name = "ScriptCard_" .. tostring(Name)
            CardFrame.Size = UDim2.new(1, 0, 0, Desc ~= "" and 56 or 44)
            CardFrame.BackgroundColor3 = CurrentTheme.BgCard
            CardFrame.BackgroundTransparency = 0.72
            CardFrame.BorderSizePixel = 0
            CardFrame.Parent = TabPage
            RegisterThemeObject("Cards", CardFrame, "BackgroundColor3")

            local CardCorner = Instance.new("UICorner")
            CardCorner.CornerRadius = UDim.new(0, 5) -- Bo nhẹ 5px
            CardCorner.Parent = CardFrame

            local CardStroke = Instance.new("UIStroke")
            CardStroke.Color = CurrentTheme.Border
            CardStroke.Transparency = 0.7
            CardStroke.Thickness = 1
            CardStroke.Parent = CardFrame
            RegisterThemeObject("Borders", CardStroke, "Color")

            -- Dải màu accent bên mép trái
            local AccentStrip = Instance.new("Frame")
            AccentStrip.Name = "AccentStrip"
            AccentStrip.Size = UDim2.new(0, 3.5, 1, 0)
            AccentStrip.BackgroundColor3 = CurrentTheme.Accent
            AccentStrip.BorderSizePixel = 0
            AccentStrip.Parent = CardFrame
            RegisterThemeObject("Accents", AccentStrip, "BackgroundColor3")

            local StripCorner = Instance.new("UICorner")
            StripCorner.CornerRadius = UDim.new(0, 2)
            StripCorner.Parent = AccentStrip

            -- Chỉ hiển thị logo nếu là nút có sẵn (như Eclipse Hub)
            local textOffsetLeft = 14
            if IsPreset then
                local IconBox = Instance.new("Frame")
                IconBox.Name = "IconBox"
                IconBox.Size = UDim2.new(0, 28, 0, 28)
                IconBox.Position = UDim2.new(0, 12, 0.5, 0)
                IconBox.AnchorPoint = Vector2.new(0, 0.5)
                IconBox.BackgroundColor3 = CurrentTheme.Accent
                IconBox.BackgroundTransparency = 0.8
                IconBox.BorderSizePixel = 0
                IconBox.Parent = CardFrame
                RegisterThemeObject("Accents", IconBox, "BackgroundColor3")

                local IconBoxCorner = Instance.new("UICorner")
                IconBoxCorner.CornerRadius = UDim.new(0, 5)
                IconBoxCorner.Parent = IconBox

                local CardIcon = Instance.new("ImageLabel")
                CardIcon.Name = "CardIcon"
                CardIcon.Size = UDim2.new(1, -6, 1, -6)
                CardIcon.Position = UDim2.new(0.5, 0, 0.5, 0)
                CardIcon.AnchorPoint = Vector2.new(0.5, 0.5)
                CardIcon.BackgroundTransparency = 1
                CardIcon.Image = caotuananhdsync.Logo or Icons.Logo
                CardIcon.Parent = IconBox

                local LogoCorner = Instance.new("UICorner")
                LogoCorner.CornerRadius = UDim.new(0, 4)
                LogoCorner.Parent = CardIcon

                textOffsetLeft = 48
            end

            -- Tiêu đề Script
            local TitleLabel = Instance.new("TextLabel")
            TitleLabel.Name = "TitleLabel"
            TitleLabel.Size = UDim2.new(1, -(textOffsetLeft + 90), 0, 18)
            TitleLabel.Position = UDim2.new(0, textOffsetLeft, 0, Desc ~= "" and 9 or 13)
            TitleLabel.BackgroundTransparency = 1
            TitleLabel.Font = Enum.Font.GothamBold
            TitleLabel.Text = Name
            TitleLabel.TextColor3 = CurrentTheme.TextPrimary
            TitleLabel.TextSize = 13
            TitleLabel.TextXAlignment = Enum.TextXAlignment.Left
            TitleLabel.Parent = CardFrame
            RegisterThemeObject("TextsPrimary", TitleLabel, "TextColor3")

            -- Badge phân loại
            if Badge and Badge ~= "" then
                local BadgePill = Instance.new("TextLabel")
                BadgePill.Name = "BadgePill"
                BadgePill.Size = UDim2.new(0, 0, 0, 16)
                BadgePill.AutomaticSize = Enum.AutomaticSize.X
                BadgePill.Position = UDim2.new(1, -48, 0, Desc ~= "" and 9 or 13)
                BadgePill.AnchorPoint = Vector2.new(1, 0)
                BadgePill.BackgroundColor3 = CurrentTheme.Accent
                BadgePill.BackgroundTransparency = 0.85
                BadgePill.Font = Enum.Font.Code
                BadgePill.Text = " " .. tostring(Badge) .. " "
                BadgePill.TextColor3 = CurrentTheme.Light
                BadgePill.TextSize = 9
                BadgePill.Parent = CardFrame
                RegisterThemeObject("Accents", BadgePill, "BackgroundColor3")
                RegisterThemeObject("Lights", BadgePill, "TextColor3")

                local BadgeCorner = Instance.new("UICorner")
                BadgeCorner.CornerRadius = UDim.new(0, 4) -- Bo nhẹ 4px
                BadgeCorner.Parent = BadgePill

                local BadgeStroke = Instance.new("UIStroke")
                BadgeStroke.Color = CurrentTheme.Border
                BadgeStroke.Transparency = 0.7
                BadgeStroke.Parent = BadgePill
                RegisterThemeObject("Borders", BadgeStroke, "Color")
            end

            -- Mô tả
            if Desc ~= "" then
                local DescLabel = Instance.new("TextLabel")
                DescLabel.Name = "DescLabel"
                DescLabel.Size = UDim2.new(1, -(textOffsetLeft + 60), 0, 16)
                DescLabel.Position = UDim2.new(0, textOffsetLeft, 0, 29)
                DescLabel.BackgroundTransparency = 1
                DescLabel.Font = Enum.Font.Gotham
                DescLabel.Text = Desc
                DescLabel.TextColor3 = CurrentTheme.TextSecondary
                DescLabel.TextSize = 10.5
                DescLabel.TextXAlignment = Enum.TextXAlignment.Left
                DescLabel.TextTruncate = Enum.TextTruncate.AtEnd
                DescLabel.Parent = CardFrame
                RegisterThemeObject("TextsSecondary", DescLabel, "TextColor3")
            end

            -- Icon con trỏ chuột bên phải
            local PointerIcon = Instance.new("ImageLabel")
            PointerIcon.Name = "PointerIcon"
            PointerIcon.Size = UDim2.new(0, 18, 0, 18)
            PointerIcon.Position = UDim2.new(1, -14, 0.5, 0)
            PointerIcon.AnchorPoint = Vector2.new(1, 0.5)
            PointerIcon.BackgroundTransparency = 1
            PointerIcon.Image = Icons["lucide-mouse-pointer-click"] or "rbxassetid://10734900135"
            PointerIcon.ImageColor3 = Color3.fromRGB(150, 155, 170)
            PointerIcon.ImageTransparency = 0.35
            PointerIcon.Parent = CardFrame

            -- Nút bấm bao trùm thẻ
            local FullCardBtn = Instance.new("TextButton")
            FullCardBtn.Name = "FullCardBtn"
            FullCardBtn.Size = UDim2.new(1, 0, 1, 0)
            FullCardBtn.BackgroundTransparency = 1
            FullCardBtn.Text = ""
            FullCardBtn.ZIndex = 5
            FullCardBtn.Parent = CardFrame

            -- Hiệu ứng Hover & Click
            FullCardBtn.MouseEnter:Connect(function()
                TweenService:Create(CardStroke, TweenInfo.new(0.2), { Transparency = 0.25, Color = CurrentTheme.Bright }):Play()
                TweenService:Create(PointerIcon, TweenInfo.new(0.2), { ImageTransparency = 0, ImageColor3 = CurrentTheme.Bright }):Play()
                TweenService:Create(CardFrame, TweenInfo.new(0.2), { BackgroundTransparency = 0.6 }):Play()
            end)

            FullCardBtn.MouseLeave:Connect(function()
                TweenService:Create(CardStroke, TweenInfo.new(0.2), { Transparency = 0.7, Color = CurrentTheme.Border }):Play()
                TweenService:Create(PointerIcon, TweenInfo.new(0.2), { ImageTransparency = 0.35, ImageColor3 = Color3.fromRGB(150, 155, 170) }):Play()
                TweenService:Create(CardFrame, TweenInfo.new(0.2), { BackgroundTransparency = 0.72 }):Play()
            end)

            FullCardBtn.MouseButton1Click:Connect(function()
                TweenService:Create(CardFrame, TweenInfo.new(0.08), { Size = UDim2.new(1, -6, 0, Desc ~= "" and 52 or 40) }):Play()
                task.delay(0.08, function()
                    TweenService:Create(CardFrame, TweenInfo.new(0.15, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                        Size = UDim2.new(1, 0, 0, Desc ~= "" and 56 or 44)
                    }):Play()
                end)

                UIScriptHub:Notification({
                    Title = "Thực Thi Script",
                    Content = "Đang chạy: " .. tostring(Name),
                    Icon = "Play",
                    Duration = 2
                })

                pcall(Callback)
            end)

            return CardFrame
        end

        function TabObj:CreateToggle(toggleConfig)
            toggleConfig = toggleConfig or {}
            local Name = toggleConfig.Name or "Toggle"
            local Desc = toggleConfig.Description or ""
            local State = toggleConfig.Default or false
            local Callback = toggleConfig.Callback or function() end

            local Frame = Instance.new("Frame")
            Frame.Size = UDim2.new(1, -6, 0, Desc ~= "" and 52 or 40)
            Frame.BackgroundColor3 = CurrentTheme.BgInner
            Frame.BackgroundTransparency = 0.35
            Frame.Parent = TabPage

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 10)
            Corner.Parent = Frame

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = CurrentTheme.Border
            Stroke.Transparency = 0.75
            Stroke.Parent = Frame

            local Title = Instance.new("TextLabel")
            Title.Size = UDim2.new(1, -70, 0, 18)
            Title.Position = UDim2.new(0, 14, 0, Desc ~= "" and 8 or 11)
            Title.BackgroundTransparency = 1
            Title.Font = Enum.Font.GothamBold
            Title.Text = Name
            Title.TextColor3 = Color3.fromRGB(248, 250, 252)
            Title.TextSize = 13
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = Frame

            if Desc ~= "" then
                local Sub = Instance.new("TextLabel")
                Sub.Size = UDim2.new(1, -70, 0, 14)
                Sub.Position = UDim2.new(0, 14, 0, 28)
                Sub.BackgroundTransparency = 1
                Sub.Font = Enum.Font.Gotham
                Sub.Text = Desc
                Sub.TextColor3 = Color3.fromRGB(148, 163, 184)
                Sub.TextSize = 10.5
                Sub.TextXAlignment = Enum.TextXAlignment.Left
                Sub.Parent = Frame
            end

            -- Toggle Pill
            local ToggleBg = Instance.new("TextButton")
            ToggleBg.Size = UDim2.new(0, 42, 0, 22)
            ToggleBg.Position = UDim2.new(1, -54, 0.5, 0)
            ToggleBg.AnchorPoint = Vector2.new(0, 0.5)
            ToggleBg.BackgroundColor3 = State and CurrentTheme.Accent or Color3.fromRGB(25, 25, 35)
            ToggleBg.Text = ""
            ToggleBg.Parent = Frame

            local ToggleCorner = Instance.new("UICorner")
            ToggleCorner.CornerRadius = UDim.new(1, 0)
            ToggleCorner.Parent = ToggleBg

            local ToggleDot = Instance.new("Frame")
            ToggleDot.Size = UDim2.new(0, 16, 0, 16)
            ToggleDot.Position = UDim2.new(0, State and 23 or 3, 0.5, 0)
            ToggleDot.AnchorPoint = Vector2.new(0, 0.5)
            ToggleDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleDot.Parent = ToggleBg

            local DotCorner = Instance.new("UICorner")
            DotCorner.CornerRadius = UDim.new(1, 0)
            DotCorner.Parent = ToggleDot

            local function updateToggle()
                TweenService:Create(ToggleBg, TweenInfo.new(0.2), {
                    BackgroundColor3 = State and CurrentTheme.Accent or Color3.fromRGB(25, 25, 35)
                }):Play()
                TweenService:Create(ToggleDot, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = UDim2.new(0, State and 23 or 3, 0.5, 0)
                }):Play()
                pcall(Callback, State)
            end

            ToggleBg.MouseButton1Click:Connect(function()
                State = not State
                updateToggle()
            end)

            return Frame
        end

        function TabObj:CreateSlider(sliderConfig)
            sliderConfig = sliderConfig or {}
            local Name = sliderConfig.Name or "Slider"
            local Min = sliderConfig.Min or 0
            local Max = sliderConfig.Max or 100
            local Val = sliderConfig.Default or Min
            local Rounding = sliderConfig.Rounding or 0
            local Callback = sliderConfig.Callback or function() end

            local Frame = Instance.new("Frame")
            Frame.Size = UDim2.new(1, -6, 0, 56)
            Frame.BackgroundColor3 = CurrentTheme.BgInner
            Frame.BackgroundTransparency = 0.35
            Frame.Parent = TabPage

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 10)
            Corner.Parent = Frame

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = CurrentTheme.Border
            Stroke.Transparency = 0.75
            Stroke.Parent = Frame

            local Title = Instance.new("TextLabel")
            Title.Size = UDim2.new(0.7, 0, 0, 18)
            Title.Position = UDim2.new(0, 14, 0, 8)
            Title.BackgroundTransparency = 1
            Title.Font = Enum.Font.GothamBold
            Title.Text = Name
            Title.TextColor3 = Color3.fromRGB(248, 250, 252)
            Title.TextSize = 13
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = Frame

            local ValLabel = Instance.new("TextLabel")
            ValLabel.Size = UDim2.new(0.3, -14, 0, 18)
            ValLabel.Position = UDim2.new(0.7, 0, 0, 8)
            ValLabel.BackgroundTransparency = 1
            ValLabel.Font = Enum.Font.Code
            ValLabel.Text = tostring(Val)
            ValLabel.TextColor3 = CurrentTheme.Light
            ValLabel.TextSize = 12
            ValLabel.TextXAlignment = Enum.TextXAlignment.Right
            ValLabel.Parent = Frame

            local SliderTrack = Instance.new("TextButton")
            SliderTrack.Size = UDim2.new(1, -28, 0, 6)
            SliderTrack.Position = UDim2.new(0, 14, 0, 36)
            SliderTrack.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
            SliderTrack.Text = ""
            SliderTrack.AutoButtonColor = false
            SliderTrack.Parent = Frame

            local TrackCorner = Instance.new("UICorner")
            TrackCorner.CornerRadius = UDim.new(1, 0)
            TrackCorner.Parent = SliderTrack

            local pct = math.clamp((Val - Min) / (Max - Min), 0, 1)
            local SliderFill = Instance.new("Frame")
            SliderFill.Size = UDim2.new(pct, 0, 1, 0)
            SliderFill.BackgroundColor3 = CurrentTheme.Accent
            SliderFill.BorderSizePixel = 0
            SliderFill.Parent = SliderTrack

            local FillCorner = Instance.new("UICorner")
            FillCorner.CornerRadius = UDim.new(1, 0)
            FillCorner.Parent = SliderFill

            local function setValFromInput(inputPos)
                local relative = math.clamp((inputPos.X - SliderTrack.AbsolutePosition.X) / SliderTrack.AbsoluteSize.X, 0, 1)
                local rawVal = Min + (Max - Min) * relative
                if Rounding == 0 then
                    Val = math.floor(rawVal + 0.5)
                else
                    Val = math.floor(rawVal * (10 ^ Rounding) + 0.5) / (10 ^ Rounding)
                end
                ValLabel.Text = tostring(Val)
                SliderFill.Size = UDim2.new(relative, 0, 1, 0)
                pcall(Callback, Val)
            end

            local sliding = false
            SliderTrack.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    sliding = true
                    setValFromInput(input.Position)
                end
            end)

            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    sliding = false
                end
            end)

            UserInputService.InputChanged:Connect(function(input)
                if sliding and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    setValFromInput(input.Position)
                end
            end)

            return Frame
        end

        function TabObj:CreateDropdown(dropConfig)
            dropConfig = dropConfig or {}
            local Name = dropConfig.Name or "Dropdown"
            local Options = dropConfig.Options or {}
            local Selected = dropConfig.Default or Options[1] or ""
            local Callback = dropConfig.Callback or function() end

            local Frame = Instance.new("Frame")
            Frame.Size = UDim2.new(1, -6, 0, 44)
            Frame.BackgroundColor3 = CurrentTheme.BgInner
            Frame.BackgroundTransparency = 0.35
            Frame.Parent = TabPage

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 10)
            Corner.Parent = Frame

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = CurrentTheme.Border
            Stroke.Transparency = 0.75
            Stroke.Parent = Frame

            local Title = Instance.new("TextLabel")
            Title.Size = UDim2.new(0.5, 0, 1, 0)
            Title.Position = UDim2.new(0, 14, 0, 0)
            Title.BackgroundTransparency = 1
            Title.Font = Enum.Font.GothamBold
            Title.Text = Name
            Title.TextColor3 = Color3.fromRGB(248, 250, 252)
            Title.TextSize = 13
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = Frame

            local DropBtn = Instance.new("TextButton")
            DropBtn.Size = UDim2.new(0.45, 0, 0, 28)
            DropBtn.Position = UDim2.new(1, -14, 0.5, 0)
            DropBtn.AnchorPoint = Vector2.new(1, 0.5)
            DropBtn.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
            DropBtn.Font = Enum.Font.GothamMedium
            DropBtn.Text = tostring(Selected) .. "  ▼"
            DropBtn.TextColor3 = CurrentTheme.Light
            DropBtn.TextSize = 11
            DropBtn.Parent = Frame

            local BtnCorner = Instance.new("UICorner")
            BtnCorner.CornerRadius = UDim.new(0, 8)
            BtnCorner.Parent = DropBtn

            local optIndex = 1
            DropBtn.MouseButton1Click:Connect(function()
                optIndex = optIndex + 1
                if optIndex > #Options then optIndex = 1 end
                Selected = Options[optIndex] or ""
                DropBtn.Text = tostring(Selected) .. "  ▼"
                pcall(Callback, Selected)
            end)

            return Frame
        end

        function TabObj:CreateInput(inputConfig)
            inputConfig = inputConfig or {}
            local Name = inputConfig.Name or "Input"
            local Placeholder = inputConfig.Placeholder or "Nhập văn bản..."
            local Callback = inputConfig.Callback or function() end

            local Frame = Instance.new("Frame")
            Frame.Size = UDim2.new(1, -6, 0, 44)
            Frame.BackgroundColor3 = CurrentTheme.BgInner
            Frame.BackgroundTransparency = 0.35
            Frame.Parent = TabPage

            local Corner = Instance.new("UICorner")
            Corner.CornerRadius = UDim.new(0, 10)
            Corner.Parent = Frame

            local Stroke = Instance.new("UIStroke")
            Stroke.Color = CurrentTheme.Border
            Stroke.Transparency = 0.75
            Stroke.Parent = Frame

            local Title = Instance.new("TextLabel")
            Title.Size = UDim2.new(0.4, 0, 1, 0)
            Title.Position = UDim2.new(0, 14, 0, 0)
            Title.BackgroundTransparency = 1
            Title.Font = Enum.Font.GothamBold
            Title.Text = Name
            Title.TextColor3 = Color3.fromRGB(248, 250, 252)
            Title.TextSize = 13
            Title.TextXAlignment = Enum.TextXAlignment.Left
            Title.Parent = Frame

            local Box = Instance.new("TextBox")
            Box.Size = UDim2.new(0.55, -14, 0, 28)
            Box.Position = UDim2.new(1, -14, 0.5, 0)
            Box.AnchorPoint = Vector2.new(1, 0.5)
            Box.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
            Box.Font = Enum.Font.Gotham
            Box.PlaceholderText = Placeholder
            Box.PlaceholderColor3 = Color3.fromRGB(120, 120, 135)
            Box.Text = ""
            Box.TextColor3 = Color3.fromRGB(255, 255, 255)
            Box.TextSize = 11.5
            Box.ClearTextOnFocus = false
            Box.Parent = Frame

            local BoxCorner = Instance.new("UICorner")
            BoxCorner.CornerRadius = UDim.new(0, 8)
            BoxCorner.Parent = Box

            Box.FocusLost:Connect(function(enterPressed)
                pcall(Callback, Box.Text)
            end)

            return Frame
        end

        -- ================= DỰNG SECTION THEMES (3 THEMES: WHITE, BLACK, GOLD) =================
        function TabObj:BuildThemeSection()
            for _, child in ipairs(TabPage:GetChildren()) do
                if child:IsA("GuiObject") then
                    child:Destroy()
                end
            end

            local SectionTitle = Instance.new("TextLabel")
            SectionTitle.Size = UDim2.new(1, 0, 0, 24)
            SectionTitle.BackgroundTransparency = 1
            SectionTitle.Font = Enum.Font.GothamBold
            SectionTitle.Text = "BỘ SƯU TẬP GIAO DIỆN (THEME UI)"
            SectionTitle.TextColor3 = CurrentTheme.Light
            SectionTitle.TextSize = 13.5
            SectionTitle.TextXAlignment = Enum.TextXAlignment.Left
            SectionTitle.Parent = TabPage
            RegisterThemeObject("Lights", SectionTitle, "TextColor3")

            local SectionDesc = Instance.new("TextLabel")
            SectionDesc.Size = UDim2.new(1, 0, 0, 20)
            SectionDesc.BackgroundTransparency = 1
            SectionDesc.Font = Enum.Font.Gotham
            SectionDesc.Text = "Click vào bất kỳ vị trí nào trên thẻ để áp dụng giao diện:"
            SectionDesc.TextColor3 = CurrentTheme.TextSecondary
            SectionDesc.TextSize = 11
            SectionDesc.TextXAlignment = Enum.TextXAlignment.Left
            SectionDesc.Parent = TabPage
            RegisterThemeObject("TextsSecondary", SectionDesc, "TextColor3")

            -- Chỉ đúng 3 tên theme theo yêu cầu: White, Black, Gold
            local ThemeList = {
                { name = "White", desc = "Giao diện màu sáng Platinum", swatchBg = Color3.fromRGB(245, 245, 250), swatchBorder = Color3.fromRGB(180, 180, 190) },
                { name = "Black", desc = "Giao diện màu tối Obsidian", swatchBg = Color3.fromRGB(15, 15, 20), swatchBorder = Color3.fromRGB(80, 80, 95) },
                { name = "Gold",  desc = "Giao diện màu vàng kim sang trọng", swatchBg = Color3.fromRGB(245, 158, 11), swatchBorder = Color3.fromRGB(255, 215, 0) },
            }

            for _, tData in ipairs(ThemeList) do
                local isCurrent = (CurrentThemeName == tData.name)

                local Card = Instance.new("Frame")
                Card.Name = "ThemeCard_" .. tData.name
                Card.Size = UDim2.new(1, 0, 0, 52)
                Card.BackgroundColor3 = CurrentTheme.BgCard
                Card.BackgroundTransparency = 0.72
                Card.BorderSizePixel = 0
                Card.Parent = TabPage
                RegisterThemeObject("Cards", Card, "BackgroundColor3")

                local CardCorner = Instance.new("UICorner")
                CardCorner.CornerRadius = UDim.new(0, 5) -- Bo nhẹ 5px
                CardCorner.Parent = Card

                local CardStroke = Instance.new("UIStroke")
                CardStroke.Color = isCurrent and CurrentTheme.Bright or CurrentTheme.Border
                CardStroke.Transparency = isCurrent and 0.25 or 0.7
                CardStroke.Thickness = 1
                CardStroke.Parent = Card
                RegisterThemeObject("Borders", CardStroke, "Color")

                -- Swatch xem trước màu sắc bo nhẹ thanh lịch
                local Swatch = Instance.new("Frame")
                Swatch.Size = UDim2.new(0, 20, 0, 20)
                Swatch.Position = UDim2.new(0, 14, 0.5, 0)
                Swatch.AnchorPoint = Vector2.new(0, 0.5)
                Swatch.BackgroundColor3 = tData.swatchBg
                Swatch.BorderSizePixel = 0
                Swatch.Parent = Card

                local SwatchCorner = Instance.new("UICorner")
                SwatchCorner.CornerRadius = UDim.new(0, 4) -- Bo nhẹ 4px
                SwatchCorner.Parent = Swatch

                local SwatchStroke = Instance.new("UIStroke")
                SwatchStroke.Color = tData.swatchBorder
                SwatchStroke.Thickness = 1
                SwatchStroke.Parent = Swatch

                -- Tên theme chỉ có White, Black, Gold (không có gạch nối)
                local LabelName = Instance.new("TextLabel")
                LabelName.Size = UDim2.new(1, -150, 0, 18)
                LabelName.Position = UDim2.new(0, 44, 0, 8)
                LabelName.BackgroundTransparency = 1
                LabelName.Font = Enum.Font.GothamBold
                LabelName.Text = tData.name
                LabelName.TextColor3 = CurrentTheme.TextPrimary
                LabelName.TextSize = 13
                LabelName.TextXAlignment = Enum.TextXAlignment.Left
                LabelName.Parent = Card
                RegisterThemeObject("TextsPrimary", LabelName, "TextColor3")

                local LabelDesc = Instance.new("TextLabel")
                LabelDesc.Size = UDim2.new(1, -150, 0, 14)
                LabelDesc.Position = UDim2.new(0, 44, 0, 27)
                LabelDesc.BackgroundTransparency = 1
                LabelDesc.Font = Enum.Font.Gotham
                LabelDesc.Text = tData.desc
                LabelDesc.TextColor3 = CurrentTheme.TextSecondary
                LabelDesc.TextSize = 10.5
                LabelDesc.TextXAlignment = Enum.TextXAlignment.Left
                LabelDesc.Parent = Card
                RegisterThemeObject("TextsSecondary", LabelDesc, "TextColor3")

                -- Phía bên phải: Badge "Đang Dùng" hoặc Icon con trỏ chuột
                if isCurrent then
                    local ActiveBadge = Instance.new("Frame")
                    ActiveBadge.Size = UDim2.new(0, 92, 0, 24)
                    ActiveBadge.Position = UDim2.new(1, -14, 0.5, 0)
                    ActiveBadge.AnchorPoint = Vector2.new(1, 0.5)
                    ActiveBadge.BackgroundColor3 = CurrentTheme.Accent
                    ActiveBadge.BackgroundTransparency = 0.4
                    ActiveBadge.Parent = Card
                    RegisterThemeObject("Accents", ActiveBadge, "BackgroundColor3")

                    local BadgeCorner = Instance.new("UICorner")
                    BadgeCorner.CornerRadius = UDim.new(0, 4) -- Bo nhẹ
                    BadgeCorner.Parent = ActiveBadge

                    local CheckIcon = Instance.new("ImageLabel")
                    CheckIcon.Size = UDim2.new(0, 14, 0, 14)
                    CheckIcon.Position = UDim2.new(0, 8, 0.5, 0)
                    CheckIcon.AnchorPoint = Vector2.new(0, 0.5)
                    CheckIcon.BackgroundTransparency = 1
                    CheckIcon.Image = Icons.Check or "rbxassetid://10709790644"
                    CheckIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
                    CheckIcon.Parent = ActiveBadge

                    local CheckText = Instance.new("TextLabel")
                    CheckText.Size = UDim2.new(1, -26, 1, 0)
                    CheckText.Position = UDim2.new(0, 24, 0, 0)
                    CheckText.BackgroundTransparency = 1
                    CheckText.Font = Enum.Font.GothamBold
                    CheckText.Text = "Đang Dùng"
                    CheckText.TextColor3 = Color3.fromRGB(255, 255, 255)
                    CheckText.TextSize = 10
                    CheckText.TextXAlignment = Enum.TextXAlignment.Left
                    CheckText.Parent = ActiveBadge
                else
                    local MouseIcon = Instance.new("ImageLabel")
                    MouseIcon.Name = "MousePointerIcon"
                    MouseIcon.Size = UDim2.new(0, 18, 0, 18)
                    MouseIcon.Position = UDim2.new(1, -18, 0.5, 0)
                    MouseIcon.AnchorPoint = Vector2.new(0.5, 0.5)
                    MouseIcon.BackgroundTransparency = 1
                    MouseIcon.Image = Icons["lucide-mouse-pointer-click"] or "rbxassetid://10734900135"
                    MouseIcon.ImageColor3 = Color3.fromRGB(150, 155, 170)
                    MouseIcon.ImageTransparency = 0.35
                    MouseIcon.Parent = Card
                end

                -- Click bất kỳ chỗ nào trên thẻ để áp dụng theme
                local ClickBtn = Instance.new("TextButton")
                ClickBtn.Size = UDim2.new(1, 0, 1, 0)
                ClickBtn.BackgroundTransparency = 1
                ClickBtn.Text = ""
                ClickBtn.ZIndex = 5
                ClickBtn.Parent = Card

                ClickBtn.MouseEnter:Connect(function()
                    TweenService:Create(CardStroke, TweenInfo.new(0.2), { Transparency = 0.2, Color = CurrentTheme.Bright }):Play()
                    TweenService:Create(Card, TweenInfo.new(0.2), { BackgroundTransparency = 0.6 }):Play()
                end)

                ClickBtn.MouseLeave:Connect(function()
                    if CurrentThemeName ~= tData.name then
                        TweenService:Create(CardStroke, TweenInfo.new(0.2), { Transparency = 0.7, Color = CurrentTheme.Border }):Play()
                    end
                    TweenService:Create(Card, TweenInfo.new(0.2), { BackgroundTransparency = 0.72 }):Play()
                end)

                ClickBtn.MouseButton1Click:Connect(function()
                    ApplyTheme(tData.name)
                    self:BuildThemeSection()
                    UIScriptHub:Notification({
                        Title = "Đổi Theme",
                        Content = "Đã áp dụng: " .. tData.name,
                        Icon = "Palette",
                        Duration = 2
                    })
                end)
            end
        end

        function TabObj:BuildConfigSection()
            self:BuildThemeSection()
        end

        table.insert(Window.Tabs, TabObj)

        -- Kích hoạt tab đầu tiên
        if #Window.Tabs == 1 then
            activateTab()
        end

        return TabObj
    end

    -- ================= CREATE HOME TAB =================
    function Window:CreateHomeTab(homeConfig)
        homeConfig = homeConfig or {}
        local Tab = self:CreateTab({
            Name = "Trang Chủ",
            Icon = "Home"
        })

        local Banner = Instance.new("Frame")
        Banner.Size = UDim2.new(1, -6, 0, 110)
        Banner.BackgroundColor3 = CurrentTheme.BgInner
        Banner.BackgroundTransparency = 0.35
        Banner.Parent = Tab.Page

        local BannerCorner = Instance.new("UICorner")
        BannerCorner.CornerRadius = UDim.new(0, 12)
        BannerCorner.Parent = Banner

        local BannerStroke = Instance.new("UIStroke")
        BannerStroke.Color = CurrentTheme.Border
        BannerStroke.Transparency = 0.6
        BannerStroke.Parent = Banner

        local WelcomeTitle = Instance.new("TextLabel")
        WelcomeTitle.Size = UDim2.new(1, -20, 0, 22)
        WelcomeTitle.Position = UDim2.new(0, 14, 0, 12)
        WelcomeTitle.BackgroundTransparency = 1
        WelcomeTitle.Font = Enum.Font.GothamBold
        WelcomeTitle.Text = "🌸 Chào mừng bạn đến với " .. WindowName .. "!"
        WelcomeTitle.TextColor3 = CurrentTheme.Light
        WelcomeTitle.TextSize = 14
        WelcomeTitle.TextXAlignment = Enum.TextXAlignment.Left
        WelcomeTitle.Parent = Banner

        local WelcomeDesc = Instance.new("TextLabel")
        WelcomeDesc.Size = UDim2.new(1, -28, 0, 36)
        WelcomeDesc.Position = UDim2.new(0, 14, 0, 38)
        WelcomeDesc.BackgroundTransparency = 1
        WelcomeDesc.Font = Enum.Font.Gotham
        WelcomeDesc.Text = "Hệ thống tổng hợp script Roblox VIP độc quyền. Nhấn sang tab 'ScriptOpener' để chọn và thực thi các tựa game yêu thích."
        WelcomeDesc.TextColor3 = Color3.fromRGB(148, 163, 184)
        WelcomeDesc.TextSize = 11.5
        WelcomeDesc.TextWrapped = true
        WelcomeDesc.TextXAlignment = Enum.TextXAlignment.Left
        WelcomeDesc.Parent = Banner

        if homeConfig.DiscordInvite then
            local BtnDiscord = Instance.new("TextButton")
            BtnDiscord.Size = UDim2.new(0, 140, 0, 24)
            BtnDiscord.Position = UDim2.new(0, 14, 0, 78)
            BtnDiscord.BackgroundColor3 = Color3.fromRGB(88, 101, 242)
            BtnDiscord.Font = Enum.Font.GothamBold
            BtnDiscord.Text = "Tham Gia Discord"
            BtnDiscord.TextColor3 = Color3.fromRGB(255, 255, 255)
            BtnDiscord.TextSize = 11
            BtnDiscord.Parent = Banner

            local DiscCorner = Instance.new("UICorner")
            DiscCorner.CornerRadius = UDim.new(0, 6)
            DiscCorner.Parent = BtnDiscord

            BtnDiscord.MouseButton1Click:Connect(function()
                if setclipboard then
                    setclipboard("https://discord.gg/" .. tostring(homeConfig.DiscordInvite))
                    UIScriptHub:Notification({
                        Title = "Discord Invite",
                        Content = "Đã sao chép link Discord vào bộ nhớ tạm!",
                        Duration = 3
                    })
                end
            end)
        end

        return Tab
    end

    return Window
end

-- ================= HỆ THỐNG NOTIFICATION (TOAST) =================
function UIScriptHub:Notification(notifConfig)
    notifConfig = notifConfig or {}
    local Title = notifConfig.Title or "Cao Tuấn Anh"
    local Content = notifConfig.Content or ""
    local Duration = notifConfig.Duration or 3.5

    local ScreenGui = TargetGuiParent:FindFirstChild("CaoTuanAnh_ScriptHubGUI")
    if not ScreenGui then return end

    local ToastContainer = ScreenGui:FindFirstChild("ToastContainer")
    if not ToastContainer then
        ToastContainer = Instance.new("Frame")
        ToastContainer.Name = "ToastContainer"
        ToastContainer.Size = UDim2.new(0, 260, 0.8, 0)
        ToastContainer.Position = UDim2.new(1, -280, 0, 20)
        ToastContainer.BackgroundTransparency = 1
        ToastContainer.Parent = ScreenGui

        local Layout = Instance.new("UIListLayout")
        Layout.FillDirection = Enum.FillDirection.Vertical
        Layout.VerticalAlignment = Enum.VerticalAlignment.Top
        Layout.Padding = UDim.new(0, 8)
        Layout.Parent = ToastContainer
    end

    local Toast = Instance.new("Frame")
    Toast.Size = UDim2.new(1, 0, 0, 54)
    Toast.BackgroundColor3 = CurrentTheme.BgCard
    Toast.BackgroundTransparency = 0.1
    Toast.Position = UDim2.new(1, 40, 0, 0)
    Toast.Parent = ToastContainer

    local ToastCorner = Instance.new("UICorner")
    ToastCorner.CornerRadius = UDim.new(0, 12)
    ToastCorner.Parent = Toast

    local ToastStroke = Instance.new("UIStroke")
    ToastStroke.Color = CurrentTheme.Bright
    ToastStroke.Thickness = 1.2
    ToastStroke.Parent = Toast

    local ToastIcon = Instance.new("ImageLabel")
    ToastIcon.Size = UDim2.new(0, 22, 0, 22)
    ToastIcon.Position = UDim2.new(0, 12, 0.5, 0)
    ToastIcon.AnchorPoint = Vector2.new(0, 0.5)
    ToastIcon.BackgroundTransparency = 1
    ToastIcon.Image = Icons.Bell
    ToastIcon.ImageColor3 = CurrentTheme.Bright
    ToastIcon.Parent = Toast

    local ToastTitle = Instance.new("TextLabel")
    ToastTitle.Size = UDim2.new(1, -44, 0, 16)
    ToastTitle.Position = UDim2.new(0, 40, 0, 10)
    ToastTitle.BackgroundTransparency = 1
    ToastTitle.Font = Enum.Font.GothamBold
    ToastTitle.Text = Title
    ToastTitle.TextColor3 = CurrentTheme.Light
    ToastTitle.TextSize = 12
    ToastTitle.TextXAlignment = Enum.TextXAlignment.Left
    ToastTitle.Parent = Toast

    local ToastContent = Instance.new("TextLabel")
    ToastContent.Size = UDim2.new(1, -44, 0, 18)
    ToastContent.Position = UDim2.new(0, 40, 0, 26)
    ToastContent.BackgroundTransparency = 1
    ToastContent.Font = Enum.Font.Gotham
    ToastContent.Text = Content
    ToastContent.TextColor3 = Color3.fromRGB(180, 190, 205)
    ToastContent.TextSize = 10.5
    ToastContent.TextXAlignment = Enum.TextXAlignment.Left
    ToastContent.TextTruncate = Enum.TextTruncate.AtEnd
    ToastContent.Parent = Toast

    -- Animation Slide In & Slide Out
    Toast.Position = UDim2.new(1, 60, 0, 0)
    TweenService:Create(Toast, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
        Position = UDim2.new(0, 0, 0, 0)
    }):Play()

    task.delay(Duration, function()
        if Toast and Toast.Parent then
            TweenService:Create(Toast, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Position = UDim2.new(1, 60, 0, 0),
                BackgroundTransparency = 1
            }):Play()
            task.wait(0.32)
            Toast:Destroy()
        end
    end)
end

return UIScriptHub
